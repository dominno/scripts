from distutils.core import setup

setup(
    name='django-continuous-scripts',
    version="0.1",
    description="Build scripts used in continuous.io",
    author="Adam Charnock",
    author_email="adam@playnice.ly",
    url="https://github.com/continuous/scripts",
    license="Apache Software License",
    
    install_requires=["django"],
    
    classifiers=[
        "Development Status :: 4 - Beta",
        "Environment :: Web Environment",
        "Intended Audience :: Developers",
        "Natural Language :: English",
        "Programming Language :: Python :: 2.6",
        "Topic :: Software Development :: Quality Assurance",
        "Topic :: Software Development :: Testing",
        "Framework :: Django",
    ]
)