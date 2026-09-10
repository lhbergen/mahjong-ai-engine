# ADR 0001: Language Selection for Game Engine and AI Layers

## Status
Accepted

## Context
Designing a Mahjong game engine to train a genetic AI model.
The game engine needs to perform complex logical validation for win state detection and rule enforcement with high execution speed.
The AI model needs to interact with modern neural network frameworks.

## Decision
Decided to use a multi-language architecture, splitting the project into two isolated environments.
Java 25+ will be used for the game engine given it's object oriented abstractions allow for handling complex game logic to be developed relatively quickly.
Python 3.13+ will be used for the AI model to leverage existing AI ecosystems.

The language seperation allows the game engine to be re-written in C++ or Rust if the Java engine proves to be a bottleneck

## Neglected Alternatives
Pure python was rejected because the engine would slow down training speeds.
Pure Java was rejected because of the limited AI ecosystem in java.
C++ or Rust was deffered because Java allows for faster intial development.

## Benefits
Takes advantage of Python's robust AI ecosystem while taking advantage of Java's increased speed to run the complex game engine, and allow room for a C++ or Rust replacement should additional speedup be needed.

## Drawbacks
The multi-language architecture requires an IPC strategy, increasing complexity.
Additionally, developers will need to maintain two seperate development environments