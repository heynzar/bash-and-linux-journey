# Regular Expressions in Bash

1.  `.`: Matches any single character

- Pattern: `"a.c"`
- Matches: "abc", "adc", "a3c", "a#c"
- Example: `echo "abc" | grep "a.c"`

2.  `[]`: Matches any character within the brackets

- Pattern: `"[aeiou]"`
- Matches: "a", "e", "i", "o", "u"
- Example: `echo "hello" | grep "[aeiou]"`

3.  `[^]`: Matches any character not within the brackets

- Pattern: `"[^0-9]"`
- Matches: "a", "x", "@", anything except digits
- Example: `echo "abc123" | grep "[^0-9]"`

4.  `-`: Defines a range of characters within brackets

- Pattern: `"[a-z]"`
- Matches: any lowercase letter from a to z
- Example: `echo "Hello123" | grep "[a-z]"`

5.  `*`: Matches zero or more occurrences of the previous character

- Pattern: `"a*"`
- Matches: "", "a", "aa", "aaa"
- Example: `echo "aaa" | grep "a*"`

6.  `+`: Matches one or more occurrences of the previous character

- Pattern: `"a+"`
- Matches: "a", "aa", "aaa" (but not "")
- Example: `echo "aaa" | grep "a\+"`

7.  `?`: Matches zero or one occurrence of the previous character

- Pattern: `"colou?r"`
- Matches: "color", "colour"
- Example: `echo "color" | grep "colou?r"`

8.  `^`: Matches the start of a line

- Pattern: `"^The"`
- Matches: "The" only at the start of a line
- Example: `echo "The cat" | grep "^The"`

9.  `$`: Matches the end of a line

- Pattern: `"end$"`
- Matches: "end" only at the end of a line
- Example: `echo "The end" | grep "end$"`

10. `{}`: Specifies exact number of occurrences

- Pattern: `"a{3}"`
- Matches: "aaa" (exactly 3 a's)
- Example: `echo "aaa" | grep "a{3}"`

11. `\`: Escapes special characters

- Pattern: `"\*"`
- Matches: literal "\*" character
- Example: `echo "5*3" | grep "\*"`

12. `()`: Groups patterns together

- Pattern: `"(ab)+"`
- Matches: "ab", "abab", "ababab"
- Example: `echo "ababab" | grep "(ab)\+"`

13. `|`: Alternation (OR operator)

- Pattern: `"cat|dog"`
- Matches: "cat" or "dog"
- Example: `echo "cat" | grep "cat\|dog"`

14. `\b`: Word boundary

- Pattern: `"\bcat\b"`
- Matches: "cat" as a whole word
- Example: `echo "cat cataract" | grep "\bcat\b"`

15. `\d`: Matches any digit (equivalent to [0-9])

- Pattern: `"\d+"`
- Matches: "123", "456"
- Example: `echo "abc123" | grep "[0-9]\+"`

16. `\w`: Matches any word character (equivalent to [a-zA-Z0-9_])

- Pattern: `"\w+"`
- Matches: "abc", "ABC123", "test_123"
- Example: `echo "Hello_123" | grep "[a-zA-Z0-9_]\+"`

17. `\s`: Matches any whitespace character

- Pattern: `"\s+"`
- Matches: spaces, tabs, newlines
- Example: `echo "Hello World" | grep "[[:space:]]\+"`

Common Use Cases:

1. Validate email address:

```bash
^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$
```

2. Match IP address:

```bash
^([0-9]{1,3}\.){3}[0-9]{1,3}$
```

3. Match date format (YYYY-MM-DD):

```bash
^[0-9]{4}-([0-1][0-9])-([0-3][0-9])$
```
