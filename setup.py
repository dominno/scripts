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
    
    package_dir={'': 'src'}
    # data_files=[
    #         ("scripts", ["src/scripts/bootstrap.sh"]),
    #         ("continuousrc", glob.glob("src/scripts/continuousrc/*")),
    #         ("services", glob.glob("src/scripts/services/*")),
    #         ("setupscripts", glob.glob("src/scripts/setupscripts/*")),
    #     ]
    # scripts=glob.glob("src/scripts/**")
    # data_files=["src/scripts/bootstrap.sh", "src/scripts/continuousrc/python"]
)
