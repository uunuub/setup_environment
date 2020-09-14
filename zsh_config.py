import os

# Open zshrc file
f = open(os.path.expanduser("~/.zshrc"), "r")
contents = f.readlines()
f.close()

# Change Plugins section
p_index = -1
for idx, val in enumerate(contents):
    if 'plugins=(' in val:
        contents[idx] = val[:-2] + ' zsh-autosuggestions' + ')'
        p_index = idx
        print(contents[idx])

# Add zsh-autosuggestions configs
zas_config = """ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=red,bold"\nbindkey '^j' autosuggest-accept\n"""
contents.insert(p_index, zas_config)

# Update zshrc file
ff = open(os.path.expanduser("~/.zshrc"), "w")
ff.write(''.join(contents))
ff.close()

