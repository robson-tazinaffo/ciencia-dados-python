from setuptools import setup

with open("README.md", "r") as fh:
    readme = fh.read()

setup(name='pacotepypi',
      version='0.0.1',
      url='https://github.com/robson-tazinaffo/ciencia-dados-python',
      license='MIT License',
      author='Mauro Robson Tazinaffo',
      long_description=readme,
      long_description_content_type="text/markdown",
      author_email='robsontazinaffo@hotmail.com',
      keywords='Pacote',
      description=u'Exemplo de pacote PyPI',
      packages=['pacotepypi'],
      install_requires=['numpy'],)
