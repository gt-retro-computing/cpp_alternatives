import argparse
import os
import subprocess
import shutil

__ITEM_LOCATION = lambda item, lang, pref="", suff="": f"{pref}{item}/{lang}{suff}"
__ITEM_PATH = lambda item, lang, pref="", suff="": __ITEM_LOCATION(item, lang, pref, "/" + item + suff)

__SUPPORTED_LANGS = {
    "zig": {
        "ext": ".zig", 
        "build": "zig build-exe {0}.zig",
    }, 
    "java": {
        "ext": ".java", 
        "build": "javac -d . {0}.java",
    }, 
    "c++": {
        "ext": ".cpp", 
        "build": "g++ {0}.cpp",
    },
    "odin": {
        "ext": ".odin",
        "build": ""
    }
}

# create
def _create_dir(dirname):
    print("Making directory:", dirname)
    if os.path.exists(dirname):
        print(f"Path '{dirname}' already exists")
        exit(1)
    os.mkdir(dirname)

def _create_file(filename):
    print("Making file:", filename)
    if os.path.exists(filename):
        print(f"Path '{filename}' already exists")
        exit(1)
    with open(filename, "w"):
        pass

def _create_supported_langs_dirs(item_name):
    _create_dir(f"src/{item_name}")
    for lang in __SUPPORTED_LANGS:
        _create_dir(f"src/{item_name}/{lang}")
        _create_file(f"src/{item_name}/{lang}/{item_name}{__SUPPORTED_LANGS[lang]['ext']}")

# build 
def _get_items_in_src():
    return [f.name for f in os.scandir("./src/") if f.is_dir()]

def _run_build_command(lang, item):
    start_dir = os.getcwd()

    try:
        print("Building %s in language %s" % (item, lang))
        os.chdir(f"{start_dir}/build/")
        subprocess.run(__SUPPORTED_LANGS[lang]["build"].format(__ITEM_PATH(item, lang, "../src/")).split(), shell=True, check=True)
        for i in [f.name for f in os.scandir(".") if f.is_file()]:
            if i.endswith(__SUPPORTED_LANGS[lang]["ext"]):
                continue
            try:
                shutil.copy("./" + i, __ITEM_LOCATION(item, lang, "../build/", "/" + i))
            except IOError:
                os.makedirs(os.path.dirname(__ITEM_LOCATION(item, lang, "../build/", "/" + i)))                
                shutil.copy("./" + i, __ITEM_LOCATION(item, lang, "../build/", "/" + i))

            os.remove("./" + i)
        os.chdir(start_dir)
        print("Success.")
    except Exception as e:
        print(e)
        os.chdir(start_dir)
        print("Failed to build: %s for language %s\nFull command was %s\n" % (item, lang, __SUPPORTED_LANGS[lang]["build"].format(__ITEM_PATH(item, lang, "./src/"))))

def _build_supported_langs(item_name):
    for lang in __SUPPORTED_LANGS:
        _run_build_command(lang, item_name)

def _build_items_in_src():
    if not os.path.exists("./build/"):
        os.mkdir("./build/")
    for item in _get_items_in_src():
        _build_supported_langs(item)

def _update_director_structure():
    for item in _get_items_in_src():
        for lang in __SUPPORTED_LANGS:
            if not os.path.exists(f"./src/{item}/{lang}"):
                _create_dir(f"./src/{item}/{lang}/")
                _create_file(f"src/{item}/{lang}/{item}{__SUPPORTED_LANGS[lang]['ext']}")



# args
argParser = argparse.ArgumentParser()
argParser.add_argument("-c", "--create", type=str, help="Create a directory structure with all supported programming languages.")
argParser.add_argument("-b", "--build", action='store_true', help="Build all the files in the src directory and places them in a separate build directory structure. Builds all supported programming languages.")
argParser.add_argument("-u", "--update", action='store_true', help="Check if all supported languages are present and if one is missing then add it for each item in the src/ directory.")

# main
if __name__ == "__main__":
    args = argParser.parse_args()

    if args.create:
        _create_supported_langs_dirs(args.create)
    if args.build:
        _build_items_in_src()
    if args.update:
        _update_director_structure()
    