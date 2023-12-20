Azure seems to have many more requirements to get a public IP that can be connected to than AWS.

This makes sense, Azure and Microsoft are known for being pretty security heavy.

I *finally* got this working! If you run this and then go to the public IP address on your browser it says "Hello World!"

This requires generation of a .ssh key and has some flaws in the code.

ssh adminuser@<public_ip_of_vm>
-- to ssh into the vm. Useful for checking and troubleshooting.
Useful for troubleshooting if having issues but deployed vm successfully.