# travel
Travel fast in my Mac  
Add a list_dir file with preset path.  
Add the following shell script to '\~/.zshrc' or '\~/.bashrc'  

```shell
# The global varible 'gptravel_abs' should be where this program is. For example:
export gptravel_abs="/Volumes/Portable Disk E/myprograms/"  
alias goto='source ${gptravel_abs}travel/goto.sh'  
```
