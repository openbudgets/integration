import os
import re

# Parameter:
# For example for Bonn:
graph_search_pattern = "ragon"


graphs_file = "input_all_graph_names.txt"
pattern = "http[\S]+\s"
template = """CLEAR GRAPH <%s>;"""
regex = re.compile(pattern)
current_dir = os.path.dirname(os.path.realpath(__file__))

with(open(os.path.join(os.getcwd(), graphs_file))) as file:
    lines = file.readlines()
    statements = []
    for line in lines:
        results = regex.findall(line)
        if results:
            statements.append(results[0])
    with(open(os.path.join(os.getcwd(), "output_drop_graph_statement.txt"), "w")) as write_file:
        drops = [template % graph.strip() for graph in statements if graph_search_pattern in graph]
        write_file.writelines([drop for drop in drops])
