---
layout: post

title: "Introduction to Design Patterns"

categories: coding

tags: [coding, design patterns, ruby, object oriented programming,
       introduction, delegation]

image:

  feature: design-patterns.jpg
  
  teaser: design-patterns-teaser.jpg
  
  credit:
  
  creditlink:
  
---

[Design Patterns: Elements of Reuseable Object-Oriented Software](https://www.amazon.com/gp/product/0201633612/ref=as_li_tl?ie=UTF8&tag=chadkreutzer-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0201633612&linkId=868c3a314f3c8199a22c226b2dad8037), also known as "The Gang of Four," is a seminal book in the coding world. Since I've been working in Ruby and Ruby is an object oriented language, I thought it would behove me to learn how to do it right. And what better way to do that than sharing it with others? This will be a series on the different design patterns cataloged in the book.

Since twenty-three is an awful lot, I'll start with the eight recommended in the Guide to Readers section:

* Abstract Factory
* Factory Method
* Adapter
* Observer
* Composite
* Strategy
* Decorator
* Template Method

According to the Gang of Four, these are the simplest and most common patterns and "This subset will help you understand design patterns in particular and good object-oriented design in general." After I finish these, I'll reassess and decide if it is worth continuing on blogging about the other fifteen. So, on with the show!

### Introduction

Design patterns are not something these four guys got together and made up one day, but rather they are a codification of solutions programmers have found to common problems. Probably my biggest takeaway from this chapter is this:

> Don't use a design pattern just because you can: Everything should serve the purpose of clear, simple, and reusable code.

Sandi Metz does a really good job of explaining this concept in her book, *99 Bottles of OOP*. You can find a sample chapter [here](https://www.sandimetz.com/99bottles/sample/). I plan to keep this in mind as I go through *Design Patterns*.

Although they don't call it a proper design pattern, **Delegation** is a good example of the CSR code problem.

### Delegation

Inheritance is the usual method you see to add functionality from one class into another one:

```
  class Rectangle
    attr_accessor :height, :width, :area
    def initialize(height, width)
      @height = height
      @width = width
    end

    def area
      @heigh * @width
    end
  end
