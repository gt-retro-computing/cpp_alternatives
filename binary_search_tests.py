def binary_search_java():
    java_format = """\t\tassertAndPrint("%s", %s, 
                BinarySearch.search(new Integer[]{%s}, %s) == %s
            );\n"""

    lines = []
    with open("./test-cases/binary_search.tc") as f:
        lines = f.readlines()

    num = int(lines[0].split("Tests: ")[1])
    lines = lines[1:]
    output = ""
    line_skip_count = 0
    for i in range(num):
        output += java_format % (
            lines[line_skip_count + i * 5][1:-1],
            lines[line_skip_count + i * 5 + 1][1:-2],
            lines[line_skip_count + i * 5 + 2][5:-2],
            lines[line_skip_count + i * 5 + 3][5:-1],
            lines[line_skip_count + i * 5 + 4][5:-1]
            )
        line_skip_count += 1

    print(output)

def binary_search_cpp():
    cpp_format = """
    \tint input%sArr[] = {%s};
    \tassertAndPrint("%s", %s, binary_search(input%sArr, %s, %s) == %s);
    """
    lines = []
    with open("./test-cases/binary_search.tc") as f:
        lines = f.readlines()

    num = int(lines[0].split("Tests: ")[1])
    lines = lines[1:]
    output = ""
    line_skip_count = 0
    for i in range(num):
        output += cpp_format % (
            lines[line_skip_count + i * 5 + 1][1:-2],
            lines[line_skip_count + i * 5 + 2][5:-2],
            lines[line_skip_count + i * 5][1:-1],
            lines[line_skip_count + i * 5 + 1][1:-2],
            lines[line_skip_count + i * 5 + 1][1:-2],
            lines[line_skip_count + i * 5 + 3][5:-1],
            len(lines[line_skip_count + i * 5 + 2][5:-2].split(",")) + 1,
            lines[line_skip_count + i * 5 + 4][5:-1]
            )
        line_skip_count += 1

    print(output)

binary_search_cpp()