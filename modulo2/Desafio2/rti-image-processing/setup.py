from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="rti-image-processing",
    version="0.0.1",
    author="Mauro Robson Tazinaffo",
    author_email="robsontazinaffo@hotmail.com",
    description="Exemplo de pacote pipy",
    long_description=readme,
    long_description_content_type="text/markdown",
    url="https://github.com/robson-tazinaffo/ciencia-dados-python/blob/main/modulo2/Desafio2/image-processing-package"
    packages=['rti-image-processing'],
    install_requires=['numpy'],
    python_requires='>=3.8',
)