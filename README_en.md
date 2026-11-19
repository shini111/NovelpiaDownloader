# NovelpiaDownloader

[한국어](README.md)

A tool to download novels from **Novelpia** and save them as **EPUB** or **TXT**.

## Download

Get `NovelpiaDownloader.exe` from the [Releases](https://github.com/CjangCjengh/NovelpiaDownloader/releases) page.

## Usage

1. Run `NovelpiaDownloader.exe`.
2. Select a language from the dropdown at the top.
3. In the **Login** group, choose how to log in.
   - Email account: enter your email and password, then click **Login**.
   - SNS account: obtain your LOGINKEY via the browser's developer tools, enter it in the LOGINKEY field, then click **Login**.
4. Adjust **threads / interval (s) / retry** as needed.
5. In the left **Download** group set:
   - **Novel number**: enter a Novelpia novel URL or novel number.
   - **From Ep. / To Ep.**: check to set a range; leave unchecked for all episodes. BONUS episodes after the final EP are counted as the next numbers after the last EP, so they fall within the range. BONUS episodes inserted mid-story follow the preceding EP's range but do not consume an EP number. Example: last EP is 100, 101 → 1 trailing BONUS, 102 → 2.
   - **Exclude BONUS / Always include BONUS**: force BONUS behavior. **Exclude** never downloads BONUS regardless of range; **Always include** downloads every BONUS regardless of range. Leave both unchecked to follow the range rule above.
   - **Save to**: output folder.
   - **Format**: EPUB / TXT.
6. Click **Download** to download immediately, or **Add to queue** to queue multiple novels, then click **Download** in the right-side list to run the batch.

## Batch list from a text file

Put the full path of a `.txt` file in **Novel number** (one novel number or URL per line) and click **Add to queue**. Every line is queued with the current settings.

## Pacing

**Interval** is the minimum pause between chapter batches. A random 0 to 1 s is added each time, so an interval of 4.0 gives 4 to 5 s. Threads inside a batch start 0.3 to 0.9 s apart. In a queue, a random 10 to 30 s pause is added between novels. Use 1 or 2 threads. An interval of 0 turns the pacing off.

## File names

Queue and list downloads are saved in the **Save to** folder as `<novel number>.epub` (or `.txt`), with `_<from>-<to>` added if you tick the range option. A single **Start** download always opens a Save dialog so you choose the name yourself.

## Failed chapters

A chapter that fails is never skipped: the downloader waits 30 seconds and tries again, for as long as it takes, until it works or you press Stop. The log shows each failed attempt with its reason. The Retry box now only applies to image downloads.

## Ranges and file numbers (old downloader behaviour)

**From Ep.** and **To Ep.** are positions in the novel's chapter list, counted from 1 and inclusive: From 25 To 30 downloads the 25th to the 30th chapter. Inside the EPUB the files are numbered by their position in the full list starting at `chapter0000`, so a range never renumbers them (From 25 gives `chapter0024` onward). **Always include BONUS** adds every BONUS chapter whatever the range, and **Exclude BONUS** skips them all.
