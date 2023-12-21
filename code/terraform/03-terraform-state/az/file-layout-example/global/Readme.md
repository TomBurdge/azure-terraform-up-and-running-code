This is much messier than the book's aws code, but achieves the things that I needed for my learning.

# On local vs remote terraform state backend storage

(I already vaguely knew this:) there is a bit of a chicken and egg situation with terraform, where you want all code under version control and all states stored on object storage. However, you need some object storage deployed via terraform in order to store that terraform state file. The book explains the approach that my team and I have already been using: the initial setup is a bit messy, where you make the bucket locally and then you can add the bucket itself alongside some other samples to the bucket (azure calls it: "container", which I have never liked! :D ). The book give shte best approach for pages 91-92. Effectively, this makes deleting the *entire* resources deployed with terraform a little more difficult, but you shouldn't need to do this often as terraform files should be global for all deployments (dev, test, prod, etc.)

I would imagine, though, this can get quite messy and fiddly when lots of projects need to be isolated and use completely different terraform projects (hence the "admin" in sysadmin).

Anyway, this is the reason there is a 'global-locally-stored' folder so that I could easily spin up the resources and destroy them still. In practice, one would have the main.tf and create-remote-storage.tf merged (with the above caveat that you initially make the backend locally and then migrate to remote alongside making the resource group).

# On terraform workspaces

It was interesting reading the author's views on workspaces.

They are not a fan, viewing it as error prone. I think we have used workspaces at Wessex, where the CI/CD (or manual bash script) sets the workspace (and cloud project/resource group etc.) based on the name of the branch (dev, test, prod) with these being the only branches that ever deploy. Although this sounds fiddly, I have found it to work quite well (for a fairly small team). But I agree with the author's point that manually managing and remembering workspaces is inevitably error prone.

Whereas the isolation via file layout sounds like it would work, I am concerned that it violate DRY with (presumably) lots of identical code. Also, they respond to a concern about running terraform apply with their service Terragrunt. 
Is Terragrunt paid? I will find out later. But it describes itself as "a thin wrapper for Terraform"; I imagine there are some risks for signing off something like this at a company, as a third party tool which extends an official tool. Or what if the support goes because the business closes?

# On layout

The layout (the rest of it) would be easy to make for terraform. I think I might practice deploying an AzureSQL Server like the staging one deployed for the MySQL datastore.

The remaining concern is about needing to still do apply command a lot, but this is dealt with in the following chapter by making terraform modules.

# On secrets
Some decents notes in the book about not commiting secrets.
I find managing security is often the fiddliest thing. It's easy to deploy a very insecure app.

Having environment variables is a decent first suggestion and to reinforce using variables. I am sure more secure approaches (secrets,etc.) will come (ch 6).

# On bash executable
Good notes for using the bash executable witht the templatefile.
I have played around with the terraform functions a bit in the console. But azure doesn't seem to be as keen as aws to use the random bash file as a way of having the server/web cluster run. (although, I could just try it with the single webserver instead of a scaling one).

# On staging
Through the staging section I slapped together a few things to get something working. It doesn't entirely work, partly because the provisioning is a bit of an anti-pattern and terraform states won't work *entirely* properly before the next chapter on modules.

# Conclusion
Overall, I feel fairly comfortable with managing the terraform state, which is the main thrust of the chapter. 

Whereas some of the content on ports and the intricacies of web apps are quite challenging, I don't need to know these right now; it's good for me to pick these up along the way, but as a data engineer I can expect to deal with mostly serverless infrastructure.