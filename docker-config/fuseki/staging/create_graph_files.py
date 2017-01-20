#!/usr/bin/env python3
# Place into the folder where the ttl files are placed
import os
import re

graph_name_regex = re.compile(r"http://data\.openbudgets\.eu/.*")
sparql_query = """
PREFIX qb:   <http://purl.org/linked-data/cube#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
SELECT ?graph
WHERE {
    VALUES (?class             ?order) {
           (qb:DataSet         1)
           (skos:ConceptScheme 2)
    }
    ?graph a ?class .
  }
  ORDER BY ?order
  LIMIT 1"""

def main():
    base_path = os.getcwd()
    for root, dirs, files in os.walk("."):
        for file in files:
            if is_ttl_file(file):
                ttl_file = os.path.join(base_path, root, file)
                graph_file_name = os.path.basename(ttl_file) + ".graph"
                graph_file_path = os.path.join(os.path.dirname(ttl_file), graph_file_name)
                graph_name = get_graph_name(ttl_file)
                if graph_name:
                    create_graph_file(ttl_file, graph_name)


def is_ttl_file(file):
    names = os.path.splitext(file)
    return len(names) > 1 and names[1]==".ttl"

def get_graph_name(ttl_file):
    result = os.popen("arq --results CSV --data \"%s\" \"%s\"" % (ttl_file, sparql_query)).read()
    graph_name = graph_name_regex.findall(result)
    return graph_name[0] if graph_name else ""

def create_graph_file(graph_file_path, graph_name):
    print("graph_file_path : %s, graph_name : %s" % (graph_file_path, graph_name))
    graph_file_path =  graph_file_path + ".graph"
    with open(graph_file_path, "w") as file:
        file.write(graph_name)

main()
