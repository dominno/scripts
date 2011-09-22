import glob

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
    packages=["continuous_scripts"],
    
    package_data={
        "continuous_scripts": [
            "scripts/bootstrap.sh", 
            "scripts/continuousrc/*",
            "scripts/services/*",
            "scripts/setupscripts/*",
        ]
    },
    include_package_data=True
)
