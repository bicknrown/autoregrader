# Autolab batch submission regrader

**I AM NOT RESPONSIBLE IF YOU BREAK AUTOLAB FOR YOUR INSTITUTION WITH THIS SCRIPT**

this script is provided "as is" and comes with **absolutely no warranty** as is applicable and enforceable by local law.

with that out of the way...

## what you need to know

Use of this script assumes quite a bit of information:
* you have the ability to read and follow instructions.
* you have the ability to manually regrade individual submissions.
* you have the ability to extract the submission ids for the submissions you would like to be regraded.
* you have the ability to extract the post request headers and data for an individual regrade request.

if all of that sounds good, let's continue.

## 5000 foot view step-by-step.

1. Read the script *before* you go further.
2. Navigate to the assignment submissions page, filter and sort how you would like.
3. Open your browser console to the network tab, click regrade on a **single** assignment.
4. After successful submission, find the `post` request within the network tab.
5. take both the raw `post` request `headers` and `data`, store them somewhere.  
*READ CAREFULLY THIS NEXT STEP*
6. Replace the `header` lines (`-H`) with *each and every* `header` from the successful `post` request you made manually.  
If there are more than what the template has, you add them, if there are less, you remove the unused lines.

Each header line should look something like:
```
something: moreofsomething
```
and be translated to something like this:
```
...
-H "something: moreofsomething" \
...
```

7. Take the data from the request, and fill in the `--data` argument with it.
8. Find the URL for the successfully regraded submission, and remove the id from it.  
it should look something like:
```
https://yourtotallyawesomeuniversity.edu/courses/classyoulike/assessments/amazingassignment/regrade?submission_id=
```

9. Append the id variable, and place it in the template format.  
it should look something like this:
```
...
-v \
"https://yourtotallyawesomeuniversity.edu/courses/classyoulike/assessments/amazingassignment/regrade?submission_id=$id"
...
```
10. Extract all of the submissions you would like to be regraded, and place them **one per line** in a file called `submission_ids.txt` in the same directory as the script.  
it should look something like this:
```
...
4637285
2839574
2938593
192934
...
```

11. **Execute the script, go have a coffee(or three)**

## wrapping up

The script saves a log--`graderlog.txt`-- to keep track of jobs it has sent request for, and those it has received success codes from, just in case it gets stopped for whatever reason.

Of course, none of this would be necessary if `REGRADE ALL` just worked, but you can't always get what you want, and this is as close to the thing you need as I wanted to go.

Hopefully this helps someone in a pinch, PRs and issues are welcome for additions and fixes, as well.
