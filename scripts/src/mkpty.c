#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <pty.h>
#include <string.h>
#include <unistd.h>

int main(int argc, const char** argv)
{
    int master, slave;
    char name[256];

    int e = forkpty(&master, &slave, &name[0], NULL, NULL);
    if(0 > e) {
        printf("Error: %s\n", strerror(errno));
        return -1;
    }

    printf("Slave PTY: %s\n", name);

    if(fork()){
        // Parent
        close( slave );
    }else{
        // child
        close( master );
        close(0); // Close standard input (current terminal)
        close(1); // Close standard output (current terminal)
        close(2); // Close standard error (current terminal)
        dup(slave); // PTY becomes standard input (0)
        dup(slave); // PTY becomes standard output (1)
        dup(slave); // PTY becomes standard error (2)
        close(slave);

        setsid();
        ioctl(0, TIOCSCTTY, 1);

        // Execute target
        char **child_av;
        int i;

        // Build the command line
        child_av = (char **)malloc(ac * sizeof(char *));
        for (i = 1; i < ac; i ++)
        {
            child_av[i - 1] = strdup(av[i]);
        }
        child_av[i - 1] = NULL;
        rc = execvp(child_av[0], child_av);
    }



    return 0;
}
