# Where pandas broke

## Machine
- CPU: Intel i7-1185G7, 8 threads
- RAM: 15 GiB, no swap
- Docker 29.9.0
- Experiment memory cap: 8 GB (Docker --memory)

## Prediction (written before running)
- Bytes per row:164
- Total memory needed for all of user_logs:64GB
- Rows that fit in 8 GB:48,780,487
- Where I expect it to fail, and why: IT WILL ONLY LOAD 12% OF THE TOTAL USER LOGS FILE

## What happened

Raw evidence: [pandas-naive-run1.txt](pandas-naive-run1.txt)

- Versions: python 3.12.15, pandas 3.0.6
- Cap: 8 GB
- How it ended: it was ended by the system. "Command terminated by signal 9" (exit code 137). There was no error message, and Python did not say anything.
- Peak memory: 8,342,704 KB, about 8 GB, right at the cap
- Time: about 51 seconds before it died
- How far it got: 8,024,736 blocks × 512 bytes = 4.1 GB read, out of the 30.5 GB file, about 13.5%

Caution: 4.1 GB read doesn't mean 4.1 GB of rows stored. Some of the text it had read was still being unpacked when it died.

## Prediction vs result

1. I predicted 12%. It got through about 13.5%, which is close.
2. What I did not expect was how it failed. I expected Python to show an error like MemoryError. Instead it was killed silently, with no message at all.
3. The exit status trap: the last line of the run file says `Exit status: 0`, which normally means "success", even though the program was killed. If I had only checked that line, I would have thought it worked. The measuring tool can be wrong, so I need to check more than one sign.

## Is it pandas, or is it bigger?

Even if I load the file the smart way, it does not fit:

4 (msno as a code number) + 7 × 4 (the integers) + 8 (total_secs) = 40 bytes per row

40 × 392,106,543 rows = about 15.7 GB

My RAM is 15 GiB, about 16.1 GB. That leaves only about 0.4 GB for the system, VS Code, Docker and the extra space pandas needs while it unpacks the text. So in practice it won't fit.

The problem isn't pandas' settings. It's loading the whole file into memory at once, which any tool that works that way would hit. I need a tool that works through the file in pieces, and that is why I'm switching tools tomorrow.
