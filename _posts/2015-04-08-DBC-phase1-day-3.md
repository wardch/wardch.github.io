---
layout: post
title: DBC: Day 3
date: 2015-04-07
categories: DBC Phase 1 Blog
---

Today I learned more then I did in any other day. But most importantly I felt great and relaxed as I learned. That engineering empathy class about telling your super ego to be more compassionate with you, is really working out! I was amazingly clear headed all day in the evening, deciding to learn rspec in the evening.

<h1> Technical Learning </h1>
<ul>
  <li><h2>Zip</h2></li>
  I learned about a great method called zip in ruby, it joins two array or more together, into new arrays. It's easier to describe with code:

  {% highlight ruby %}

    a = [5,6,7]
    b = [2,4,1]

    [3,8,9].zip(a,b) Outputs=> [[3,5,2], [8,6,4], [9,7,1]]


  {% endhighlight %}

  This method is excellent for joining the elements of different arrays, in the same index place, together into one array. Think of zipping up two sets of teeth on a zip!!

![zipper](imgs/zipper.jpg)

<li><h2>Rspec</h2></li>

I wrote my first ever rspec test today and it passed. I realized that to write good simple rspec tests you just need to familiarize yourself with a couple of key words and syntax and the rest is quite intuitive.

Let's take the example of an orange tree class. When running rspec you first need to write:

{% highlight ruby %}

    describe Orange do
    end


  {% endhighlight %}

  And then write your test inbetween those two lines.

If you are going to be dealing with a variable tree, which is an object of the OrangeTree class, you can write:

{% highlight ruby %}

    describe Orange do
    let!(:tree){ OrangeTree.new }
    end


  {% endhighlight %}

The word let! followed (:tree) by  will create a variable tree which has a scope which can be accessed within any method on the same level. By writing { OrangeTree.new } we are saying that the tree is an object instantiated from the OrangeTree class, this comes in use later.

An example of an rspec test that tests that all instantiated trees have an age of 0 right away would look like:

{% highlight ruby %}

  describe '#age'
  it "should have an age of 0 when instantiated" do
    expect(tree.age)to eq(0)
  end
end

  {% endhighlight %}

Note that the use of curly braces around (tree.age) this is because we are just retrieving the value of an instances variable. If we were checking to see the result of a method we would use curly braces.

The following rspec tests the code to see if the method age! increments @age by 1 in our class:


{% highlight ruby %}

 describe '#age!' do
 context "normal incrementation"
  it "should increase the age of the tree by 1" do
    expect{tree.age!}to change{tree.age}.by(1)
  end
end

  {% endhighlight %}

You can do an interesting test on the contraints of that same method too, to make sure that the height of the tree doesn't increase once it's over the integer 50.

{% highlight ruby %}

 describe '#age!' do

 context "normal incrementation"
  it "should increase the age of the tree by 1" do
    expect{tree.age!}to change{tree.age}.by(1)
  end

  context "hight constraint of tree"
  it "should make sure that once the tree is over 50 it should not grow any further" do
    7.times {tree.age!}
    expect{tree.age!}to_not change{tree.height}
  end


end

  {% endhighlight %}

Note how all of the code in the age method is within the same block describing age.

I ran all of my rspec tests and they all tested my code.

<li><h2>An Assert Hack! The Lazy mans Rspec </h2></li>

I was told by a kind DBC graduate passing my desk of a really nice way of testing your code if you want to test it but don't want to write a whole bunch of rpsec too. (admittedly the tests wont be as robust, but they're better then nothing)

After you create an OrangeTree class and instantiate a newly born tree called "sappling", you can quickly write a method called assert outside of your class that looks as follows:

{% highlight ruby %}

def assert(expect, actual)
  raise "Expected #{expected}, got #{actual}" unless expect == actual
end

assert(0, tree.age)
assert(false, tree.dead?)

  {% endhighlight %}

These tests are AMAZIGN! It will stop your program if what you expected and what you got are different! A lazy mans rspec!

<li><h2>Reading in the morning!</li></h2>
I learned too from someone passing my desk that she thought it was really helpful to get up earlier, go into DBC, and read somewhere quite with your headphones in on the upcoming day's readings, so that you are better prepared. I might try and do that for this week. It would make my blogs stronger in the evenings too. I think I'll aim to get into DBC at around 8am everyday, and read before I head to the morning lecture.

The lecuture today was on recursion too, which I also began to understand in more depth. The key take away was, that when the breakcase of a recursive function is called, it returns a value to the function that called it! It doesnt just exit the program like a normal return function might. That means the return value is returned to all previous functions which came lower down in the stack! Understanding how return worked in a recursive function was very key to understanding how a stack works in recursion and how you are left with a big value, instead of just the value of the return function in the break statement.

I already wrote a <a href="http://wardch.github.io/recursion/2015/04/02/t8-tech.html">blog post </a> on recursion though but now I understand the topic in more depth!

</ul>

<h2> What I learned about Myself </h2>

I felt amazing today as I got more and more work done, because I maintained a curious and playful state of mind as I learned new things. I was really loving coding. I felt very energized and relaxed today, I want to try and ride this momentum into tomorrow!





