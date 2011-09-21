from distutils.core import setup
from setuptools import find_packages

setup(
    name='continuous-scripts',
    version="0.1",
    description="Scripts for use by continuous.io",
    author="Adam Charnock",
    author_email="adam@continuous.io",
    url="https://github.com/continuous/scripts",
    license="Apache Software License",
    
    classifiers=[
        "Intended Audience :: Developers",
        "Natural Language :: English",
    ],
    
    package_dir={'': 'src'},
    package_data={"": ["src/*"]}
)