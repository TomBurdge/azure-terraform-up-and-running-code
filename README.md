In the great book Azure Up and Running, there is a passage:

*"Because Terraform supports many diffferent cloud providers,a  common question that arises is whether it supports *transparent portability* between them. For example, if you used Terraform to define a bunch of servers, databases, load balancers, and other infrastructure in AWS, could you instruct Terraform to deploy exactly the same infrastructure in another cloud provider, such as Azure or Google Cloud, in just a few commands?*

*This question turns about to be a bit of a red herring. Ther reality is that you can't deploy 'exactly the same infrastructure' in a different cloud provider vecause the cloud providers don't offer the same types of infrastructure! The servers, load balancers, and databases offered by AWS are very different from those in Azure and Google Cloud in terms of features, configuration, management, security, scalability, availability, observability, and so on. There is no easy way to 'transparently' paper over these differences, expecially as functionality in one cloud provider doesn't exist at all in the others. Terraform's approach is to allow you to write code that is specific to each provider, taking advantage of that provider's unque functionality, but to use the same language, toolset, and IaC practices under the hood for all providers."* Brikman, Terraform: Up and Running p.19

This book focuses on AWS (quite rightly, the cloud provider with the highest market share) but I want to practice writing Terraform code to deploy to Azure.

I also sometimes find it to make use of code examples in O'Reilly books; rather than exercises, there is usually just code to copy.

Since it is not straightforward (admittedly, sometimes not possible) to refactor AWS terraform code to Azure terraform code, the aim of this repo is to do exactly that. 

This should be a good challenge, and it will be fun to see how feasible it is.
I expect some will be surprised at how similar services across providers are at the most basic level; a container is exactly that on any cloud provider, and so is a data warehouse.

# ReadMe From Forked Repo:

# Terraform: Up & Running Code

This repo contains the code samples for the book *[Terraform: Up and Running](http://www.terraformupandrunning.com)*, 
by [Yevgeniy Brikman](http://www.ybrikman.com).




## Looking for the 1st, 2nd, or 3rd edition?

*Terraform: Up & Running* is now on its **3rd edition**; all the code in `master` is for this edition. If you're looking
for code examples for other editions, please see the following branches:

* [1st-edition branch](https://github.com/brikis98/terraform-up-and-running-code/tree/1st-edition).
* [2nd-edition branch](https://github.com/brikis98/terraform-up-and-running-code/tree/2nd-edition).
* [3rd-edition branch](https://github.com/brikis98/terraform-up-and-running-code/tree/3rd-edition).



## Quick start

All the code is in the [code](/code) folder. The code examples are organized first by the tool or language and then
by chapter. For example, if you're looking at an example of Terraform code in Chapter 2, you'll find it in the 
[code/terraform/02-intro-to-terraform-syntax](code/terraform/02-intro-to-terraform-syntax) folder; if you're looking at 
an OPA (Rego) example in Chapter 9, you'll find it in the 
[code/opa/09-testing-terraform-code](code/opa/09-testing-terraform-code) folder.

Since this code comes from a book about Terraform, the vast majority of the code consists of Terraform examples in the 
[code/terraform](/code/terraform) folder.

For instructions on running the code, please consult the README in each folder, and, of course, the
*[Terraform: Up and Running](http://www.terraformupandrunning.com)* book.



## License

This code is released under the MIT License. See LICENSE.txt.
