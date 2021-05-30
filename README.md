# travel
Travel fast in my Mac  
Add a file 'list_dir' with preset path to the folder 'travel'. The first tag should be 'default'.
```
default Volumes/Portable Disk E/myprograms
work Volumes/Portable Disk F/mywork
...

```


Add the following shell script to '\~/.zshrc' or '\~/.bashrc'  

```shell
# The global varible 'gptravel_abs' should be the absolute path for the folder 'travel'. For example:

export gptravel_abs="/Volumes/Portable Disk E/myprograms/"  
alias goto='source ${gptravel_abs}travel/goto.sh'  
```
