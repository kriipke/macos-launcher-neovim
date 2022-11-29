#!/bin/python3

import jinja2
import os 

# build templates 
def makeTemplate(configFile):

    config_path = os.path.relpath('config/%s'.format(configFile)
    template_path = os.path.relpath('config/%s.j2'.format(configFile)

    if os.path.isFile(config_path): 

        with open(config_path, 'r') as input_file:
            with open(template_path, 'w') as output_file:

                  output_file.write('{% raw %}\n')

                  for line in input_file:
                      output_file.write(line)

                  output_file.write('{% endraw %}\n')
    else:
      Throw Exception

def buildSubTemplates(config_files)
    for config_file in config_files:
        try:
            makeTemplate(config_file)
        except Exception:
            print('Error: Failed to make vim & kitty configuration file templates')

def buildScript()
    environment = jinja2.Environment()

    file_loader = jinja2.FileSystemLoader('templates')
    env = jinja2.Environment(loader=file_loader)

    template = env.get_template('macos-automator-script.sh.j2')
    output = template.render()

    text_file = open("macos-automator-script.sh", "w")
    n = text_file.write(output)
    text_file.close()

if __name__ == "__main__":
    buildScript

