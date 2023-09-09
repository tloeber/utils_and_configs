# Put this file in ~/.ipython/profile_default/

c.InteractiveShellApp.extensions = ["nb_mypy"]
c.InteractiveShellApp.exec_lines = ["%nb_mypy mypy-options --strict"]
