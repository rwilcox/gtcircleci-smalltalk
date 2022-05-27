Circle CI GToolkit Package
================


A package for [GToolkit](https://gtoolkit.com/) to work with [CircleCI](https://circleci.com/).

Really it should work with [Pharo Smalltalk](https://pharo.org/) too, but the UI interactive stuff might not work.

Example
================


Exploring the pipeline instances and workloads for a Github Project
---------------

```smalltalk

m := CircleUrlClient new.
m clientToken: myCircleCiToken.
m setupAuth.

proj := m getProject: 'gh/rwilcox/gtcircleci-smalltalk'.
proj getPipelines.
```

This code outputs all the pipelines for the given project. Which looks like this

![project](/docs/pipelines_step_one.png)

Clicking one of the resulting pipelines gives you

![pipelines](/docs/pipelines_step_two.png)

where you can drill into the workflows declared by the pipeline

![workflows](/docs/pipelines_step_three.png)

and there there's a button to visit the workflow on the web!


Processing the objects
-------------------

Gets say we want to skip some of the middle parts and directly get any workflow resulting from any build I (rwilcox) did.

```smalltalk

m := CircleUrlClient new.
m clientToken: myCircleToken.
m setupAuth.

proj := m getProject: 'gh/rwilcox/gtcircleci-smalltalk'.

myPipelines := (proj getPipelines) select: [:each |
  (each startedBy) = 'rwilcox'
].

myWorkflows := OrderedCollection new.

myPipelines do: [:current |
  myWorkflows addAll: (current getWorkflows)
].

myWorkflows.
```

Gives us a list of workflows - clicking on one takes us straight to that third screen.
