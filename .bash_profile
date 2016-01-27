turnin(){
    scp $1 ee16a-ahu@cory.eecs.berkeley.edu:~/$2/$1;
    ssh ee16a-ahu@cory.eecs.berkeley.edu cd $2 && submit $2
}
















c(){
    gcc $1.c -o $1 && ./$1
}

alias mars='java -jar ~/berkeley/Mars4_5.jar &'
alias logisim='java -jar ~/berkeley/cs61c/logisim-generic-2.7.1.jar &'


pdf()
{
    pdflatex $1.tex && evince $1.pdf;
}




alias hddtemp='sudo hddtemp /dev/sda'
alias ..='cd ../'
