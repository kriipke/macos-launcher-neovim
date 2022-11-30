#!/bin/python3

import jinja2
import os

config_files = [ "init.vim", "kitty.conf"]
scripts = [ "macos-automator-kitty.sh", "macos-automator-nvim.sh"]

# build templates 
def renderTemplate(configFile):
    config_path = os.path.relpath('config/%s'.format(configFile))
    template_path = os.path.relpath('template/%s.j2'.format(configFile))

    if os.path.isFile(config_path):
        with open(config_path, 'r') as input_file:
            with open(template_path, 'w') as output_file:


                  output_file.write('{% raw %}\n')
                  for line in input_file:
                      output_file.write(line)
                  output_file.write('{% endraw %}\n')
    else:
        Throw Exception


def makeTemplates(config_files)
    for config_file in config_files:
        try:
            renderTemplate(config_file)
        except Exception:
            print('Error: Failed to make vim & kitty configuration file templates')


def renderScript(scriptName)
    template = env.get_template('%s.j2'.format(scriptName)
    output = template.render()

    text_file = open(scriptName, "w")
    n = text_file.write(output)
    text_file.close()

def main():
    environment = jinja2.Environment()
    file_loader = jinja2.FileSystemLoader('templates')
    env = jinja2.Environment(loader=file_loader)

    for script in scripts:
        renderScript(script)

if __name__ == "__main__":
    renderTemplate('init.vim')
    renderTemplate('kitty.conf')

    main

