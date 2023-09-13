# Put this file in ~/.ipython/profile_default/

# Activate MyPy for notebooks. Deactivate by notebook using `nb_mypy Off`
c.InteractiveShellApp.extensions = ["nb_mypy"]

# Use strict mode
c.InteractiveShellApp.exec_lines = ["%nb_mypy mypy-options --strict --pretty"]
