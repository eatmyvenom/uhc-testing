#!/bin/bash

# Function to install Git
install_git() {
    echo "Git could not be found, installing Git..."

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get update
        sudo apt-get install -y git
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew &> /dev/null
        then
            echo "Homebrew not found, installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install git
    else
        echo "Unsupported OS. Please install Git manually."
        exit 1
    fi
}

# Function to install Java 8
install_java() {
    echo "Java could not be found, installing Java 8..."

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get update
        sudo apt-get install -y openjdk-8-jdk
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew &> /dev/null
        then
            echo "Homebrew not found, installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew tap adoptopenjdk/openjdk
        brew install --cask adoptopenjdk8
    else
        echo "Unsupported OS. Please install Java manually."
        exit 1
    fi
}

# Check if git is installed
if ! command -v git &> /dev/null
then
    install_git
fi

# Check if java is installed
if ! command -v java &> /dev/null
then
    install_java
fi

echo "Git and Java are installed, proceeding with git clone..."

git clone https://github.com/eatmyvenom/uhc-testing
cd uhc-testing
open .