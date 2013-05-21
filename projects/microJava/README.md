Intent
======
Implement class extraction by means of Spoofax.


Motivation
=======
We exercise how the [extractClass](http://www.refactoring.com/catalog/extractClass.html) refactoring, introduced by Martin Fowler, can be implemented for a simple language using [Spoofax](http://strategoxt.org/Spoofax/WebHome). Spoofax is a language workbench that is based on [Stratego/XT](http://strategoxt.org/), a software language for program transformation. In this context we illustrate :
* how different strategies and various features of Spoofax/Stratego/XT can be used for a non-trivial refactoring 
* how this refactoring can be integrated into the editor UI

Architecture
=======


Syntax
-----
We use a simple toy OO-language called "MicroJava". A MicroJava program consists of classes with fields and methods. 
In Spoofax language syntax is defined using [the SDF language](http://strategoxt.org/Sdf). The syntax definition for MicroJava can be found in "syntax/MicroJava.sdf". Here is a snippet from that file:

	ID "(" {NTBinding "," }* ")" ":" Type "{" (Stm ";")* "}"		-> Member{cons("Method")}
Using a EBNF-style we declare the syntax for a method: A method starts with an ID followed by "NTBindings", pairs of names and types (the parameters). This is followed by the return type of the method and a list of statements (the statement's body).
On the right-hand side we define that such syntax constitutes a "Member". Furthermore a constructor named "Method" should be used to create values for the data type that can later be processed. The parameters of the constructor are the non-terminals.

Refactoring
---------
The actual refactoring can be found in "trans/classExtraction.str". On the top level we see this:

	extract-class:
	  (new-cn, selected-ms, pos, ast@Module(mn,csraw), path, _) 
	  -> ([(ast, Module(mn,cs'''))], [], [], [])
This signature is fixed for all refactorings. The rule gets the entered new class name, the selected members, the position within the AST, the actual ast, the path. It returns a list of changes, here just the old ast and the new one. Additionally errors, warnings and notes (here empty lists) are returned. 

The rule first annotates the class at hand with the types of referencial cascaded (e.g. "point.x.value"). For this annotated class the remaining/not-to-be-moved members are computed:

	diff-ms := <diff(\(a,b) -> <eq> (<topdown(try(rm-annotations))> a, b)\)> (old-ms, selected-ms);

In the lines 24+25 delegating methods are computed. That is, if a method "m" should be moved a new method "m" is created that just delegates to the member of the new class. In the following line a reference to the new class is added. The new class is then created in line 29 by adding all members to be extracted.

After that the referential cascades need to be fixed, depending if the referenced member was moved or not. See "replace-cas-call" for details.

Finally we have to fix references from moved members to members that were not moved. See the "replace-this" rule.

Now the new class is created and all references have been fixed.

Embedding
---------

Now comes Spoofax into play. In "editor/MicroJava-Builders.esv" we register the refactoring in line 31. We define a 
* A name for the refactoring
* A user message to show
* Which kind of syntax needs to be selected (here "Member*", many members)
* Which rule should be called, here extract-class

After that the refactoring is available in the editor when one right-clicks on selected members.


Usage
====
The assignment at hand what developed using Eclipse 3.7 (Indigo) and Spoofax plugin (1.0.9). To demo the project just:
* Import it into Eclipse
* Build the project using "build.main.xml"
* Go to test/example.mj
* Highlight fields and methods you want to extract
* Right click on highlighted text and click "Refactor" -> "Extract members to class"


Authors
=======
* Thomas Schmorleiz

