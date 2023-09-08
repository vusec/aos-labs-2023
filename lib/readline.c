#include <stdio.h>
#include <error.h>

#define BUFLEN 1024
static char buf[BUFLEN];

char *readline(const char *prompt)
{
    int i, c, echoing, buf_size;
	int command_mode = 0;
	
	if (prompt != NULL)
		cprintf("%s", prompt);
	
	i = 0, buf_size = 0;
	
	echoing = iscons(0);
	while (1) {
		c = getchar();

		// Arrow keys
		if (c == '[') { 
		  command_mode = 1;
		  continue;
		}

		if (command_mode) {
		  command_mode = 0;
		  if (c == 'D') {
			  if (i <= 0) continue;
			  
			  // Cursor go left
			  cprintf("\033[1D");
			  i--;
			continue;
		  } else if (c == 'C') {
			  if (i == buf_size) continue;
			
			  // Cursor go right 
			  cprintf("\033[1C");
			  i++;
			continue;
		  } else {
			  cputchar('[');
		  }
		  
		}
		// Implement C-a for going to the start of the line
		if (c == 0x1) {
		  cprintf("\033[%dD", i);
		  buf[i] = '\0';
		  i = 0;
		}

		// Implement C-e for going to end of the line 
		if (c == 0x5 && buf_size != i) {
		  cprintf("\033[%dC", buf_size-i);
		  i = buf_size;
		}
		if (c < 0) {
			cprintf("read error: %e\n", c);
			return NULL;
		} else if ((c == '\b' || c == '\x7f') && i > 0 && buf_size > 0) {
			// If we are the end of the buffer we can just delete the
			// last character and be done with it. 
			if (i == buf_size) {
				cputchar('\b');
				cputchar(' ');
				cputchar('\b');
				buf_size--;
				i--;
				continue;
			}

			// Go backwards by one
			cputchar('\b');
			
			// Override the character with the rest of the buffer
			int tmp = i;
			while (i != buf_size) {
				buf[i-1] = buf[i];
				cputchar(buf[i]);
				i++;
			}

			// Blank out the last character
			cputchar(' ');
			cputchar('\b');

			// Move the cursor back to our old position and shrink the
			// buffer
			cprintf("\033[%dD", i - tmp);
			i = tmp-1;

			buf_size--;
		// We ignore the 0x7f deletion character here since it is not
		// a printable character and messes with backspace
		} else if (c >= ' ' && i < BUFLEN-1 && c != 0x7f) {
			if (echoing)
				cputchar(c);
			// In our easy path we can just add the element and move on
			if (i == buf_size) {
				buf[i++] = c;
				buf_size++;
				continue;
			}

			// Add our new character to the buffer and shift everything
			// to the right.
			int cursor = i;
			char old = buf[i];
			buf[i] = c;
			while (i != buf_size) {
				char tmp = buf[i+1];
				buf[i+1] = old;
				old = tmp;
				i++;
			}

			// Increase our buffer and print it so we override the
			// current output
			buf_size++;
			i = cursor+1;			
			while (i != buf_size) {
				cputchar(buf[i++]);
			}

			// Move the cursor backwards and set the right index
			cprintf("\033[%dD", i - cursor-1);
			i = cursor+1;
		} else if (c == '\n' || c == '\r') {
			if (echoing)
				cputchar('\n');
			buf[buf_size] = 0;
			return buf;
		}
	}
}

