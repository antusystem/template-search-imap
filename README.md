# README for the robot

Simple robot with Robocorp software to show how to use all the Search Keys from the `RPA.Email.ImapSmtp` library. It should actually work with IMAP in general but I only use it in here, so I can not assure anything.


## Configuration

First you should install RCC (https://github.com/robocorp/rcc).

Configure your `devdata/env.json` to the right direction for the `vault.json` file. The credentials need to be under `emailCredential` and have a `username` and `password` items.

Or, you can hard-code your email username and password in task.robot.

Later in rcc or the console go to the robot directory and run: `rcc run --environment devdata/env.json`. OR, if you have you credentials hard-coded run: `rcc run`

## License

MIT License

Copyright (c) [2021] [Alejandro Antunes]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### Additional documentation
See [Robocorp Docs](https://robocorp.com/docs/) for more documentation.
