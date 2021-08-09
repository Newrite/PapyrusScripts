
function Make-Header {
   param ( [string]$Title = '' )
   $out = "=== $Title ";
   If ($Title -eq '') {
      $out = "=====";
   }
   $i = $out.length;
   For(;$i -lt 60;$i++) {
      $out += '=';
   }
   Return $out
}

$gHeader = @()
$gBody   = @()

function Layout-Clear {
   $gHeader = @()
   $gBody   = @()
}
function Layout-SetHeader {
   $gHeader = $args;
}
function Layout-SetBody {
   $gBody = $args;
}
function Layout-PushBody {
   $gBody += $args;
}
function Layout-Render {
   Cls
   ForEach ($s in $gHeader) {
      Write-Host $s;
   }
   ForEach ($s in $gBody) {
      Write-Host $s;
   }
}

function Pause {
   param ( [string]$Prompt = 'Press any key to continue . . . ' );
   Write-Host -NoNewLine $Prompt
   [Console]::ReadKey($true) | Out-Null
   Write-Host
}

function Array-Make {
   Return $args;
}
function Array-Toggle($a, $item) {
   If ($a.Contains($item)) {
      $a = $a | Where { $_ -ne $item };
   } Else {
      $a += $item;
   }
   Return $a;
}

function Program-Execute($program) {
   & $program $args
}
function Program-ExecuteVerbose($program) {
   & $program $args
   & { Write-Host $program $args } $args
}

function Execute-Menu {
   param (
      [string]$Title = 'Menu',
      $Options,
      [Int]$AllowMultiselect = 0,
      [Int]$ShowOptionKeys   = 1,
      [Int]$DefaultIndex     = 0
   )
   #
   $index = $DefaultIndex;
   [System.Collections.ArrayList]$selection = @();
   $done = 0;
   #
   $longest_length = 0;
   ForEach ($o in $Options) {
      If (@($o)[0].length -gt $longest_length) {
         $longest_length = @($o)[0].length;
      }
   }
   #
   function Render {
      Layout-Render;
      Write-Host (Make-Header($Title));
      For ($i=0;$i -lt $Options.length;$i++) {
         $entry = @($Options[$i]);
         $o = $entry[0];
         If ($entry.length -gt 1) {
            $d = $entry[1];
         } else {
            $d = '';
         }
         #
         $line = "$o";
         If ($d -ne '') { # pad with spaces to align all descriptions
            $line += ': ';
            For ($j=$o.length;$j -lt $longest_length;$j++) {
               $line += ' ';
            }
            $line += $d;
            If ($ShowOptionKeys -eq 0) {
               $line = $d;
            }
         }
         If ($i -eq $index) { # cursor is on this option
            $line = ' > ' + $line;
            Write-Host $line -foreground white;
         } Else { ############# cursor is not on this option
            $line = '   ' + $line;
            If ($selection.Contains($o)) {
               Write-Host $line -foreground yellow;
            } Else {
               Write-Host $line -foreground gray;
            }
         }
      }
      If ($AllowMultiselect -ne 0) { # write "OK" option if multi-select is enabled
         Write-Host '';
         If ($index -lt $Options.length) {
            Write-Host "OK" -foreground gray;
         } Else {
            Write-Host "OK" -foreground white;
         }
      }
   }
   #
   Render;
   $render_needs_update = 0;
   While ($done -eq 0) {
      If ($render_needs_update) {
         Render;
         $render_needs_update = 0;
      }
      $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
      $render_needs_update = 1;
      Switch ($key.VirtualKeyCode) {
         0x26 { # Up
            $index--;
            If ($index -lt 0) {
               If ($AllowMultiselect) {
                  $index = $Options.length;
               } Else {
                  $index = $Options.length - 1;
               }
            }
         }
         0x28 { # Down
            $index++;
            If ($AllowMultiselect) {
               If ($index -gt $Options.length) {
                  $index = 0;
               }
            } Else {
               If ($index -gt ($Options.length - 1)) {
                  $index = 0;
               }
            }
         }
         0x24 { # HOME
            $index = 0;
         }
         0x23 { # END
            If ($AllowMultiselect) {
               $index = $Options.length;
            } Else {
               $index = $Options.length - 1;
            }
         }
         0x0D { # ENTER
            If ($AllowMultiselect) {
               If ($index -ge $Options.length) {
                  $done = 1;
                  Return $selection;
               } Else {
                  $o = [array] $Options[$index];
                  $o = $o[0];
                  If ($selection.Contains($o)) {
                     $selection.Remove($o);
                  } Else {
                     [void]$selection.Add($o);
                  }
               }
            } Else {
               $done = 1;
               Return @($Options[$index])[0];
            }
         }
         default {
            $render_needs_update = 0;
         }
      }
   }
   Return '';
}

function Main {
   Layout-Clear;
   Layout-SetHeader(Make-Header('HKXCMD'));
   Layout-SetBody('    PowerShell UI by Cobb');
   Layout-Render;
   #
   $task = Execute-Menu ('Select a task') @(
         ('about',     'See HKXCmd license information'),
         ('convert',   'Convert HKX file to various representations'),
         ('convertkf', 'Convert KF file to HKX'),
         ('dumplist',  'Dump the transform or float list for a given skeleton'),
         ('exportkf',  'Convert HKX file to KF'),
         ('report',    'Generate a simple report for all supported Havok classes'),
         ('exit',      'Quit')
      )
   ;
   Switch ($task) {
      'about'     { Task-About; }
      'convert'   { Task-Convert; }
      'convertkf' { Task-ConvertKF; }
      'dumplist'  { Task-DumpList; }
      'exportkf'  { Task-ExportKF; }
      'report'    { Task-Report; }
      'exit'      { Return 0; }
   }
   Return 1;
}
function Task-About {
   Layout-Clear;
   Layout-SetHeader(
      Make-Header('HKXCMD'),
      Make-Header('About')
   );
   Layout-Render;
   & '.\hkxcmd.exe' about
   Pause;
}
function Task-Convert {
   Layout-Clear;
   Layout-SetHeader(
      Make-Header('HKXCMD'),
      Make-Header('Convert')
   );
   Layout-SetBody(
      'Read an HKX file and convert it to some other representation.'
   );
   $fileIn  = Read-Host "Input file";
   $fileOut = Read-Host "Output file";
   Layout-PushBody('Input file:  ' + $fileIn);
   Layout-PushBody('Output file: ' + $fileOut);
   $type = Execute-Menu ('Select an output type.') (
         ('DEFAULT', 'Default format (MSVC Win32 Packed)'),
         ('XML',     'Packed binary XML'),
         ('WIN32'),
         ('AMD64'),
         ('XBOX'),
         ('XBOX360'),
         ('TAGFILE'),
         ('TAGXML',  'TagFile XML')
      )
   ;
   Layout-PushBody('Type:        ' + $type);
   $flags = Execute-Menu ('Select flags.') (
         #('SAVE_DEFAULT',                   'All other flags default to OFF.'),
         ('SAVE_TEXT_FORMAT',               'Use text (usually XML) format; default is binary if available.'),
         ('SAVE_SERIALIZE_IGNORED_MEMBERS', 'Write members which are usually ignored.'),
         ('SAVE_WRITE_ATTRIBUTES',          'Include extended attributes in metadata.'),
         ('SAVE_CONCISE',                   'Omit optional helpful information (e.g. hex floats as text comments).'),
         ('SAVE_TEXT_NUMBERS',              'Floats output as text rather than binary, with a potential loss in precision.')
      ) 1
   ;
   If ($flags.length) {
      $flags = 'SAVE_DEFAULT|' + ($flags -join '|');
   } Else {
      $flags = '';
   }
   Layout-PushBody('Flags:       ' + $flags);
   #
   Layout-Render;
   & '.\hkxcmd.exe' convert -i `"$fileIn`" -o `"$fileOut`" -v:$type -f $flags
}
function Task-ConvertKF {
   Layout-Clear;
   Layout-SetHeader(
      Make-Header('HKXCMD'),
      Make-Header('ConvertKF')
   );
   Layout-SetBody(
      'Convert a Gamebryo KF animation file to a Havok HKX animation file.'
   );
   $fileSkel  = Read-Host "Input file - skeleton HKX";
   $fileAnim  = Read-Host "Input file - KF animation";
   $fileOut = Read-Host "Output file";
   Layout-PushBody('Input file - skeleton HKX: ' + $fileSkel);
   Layout-PushBody('Input file - KF animation: ' + $fileAnim);
   Layout-PushBody('Output file: ' + $fileOut);
   $type = Execute-Menu ('Select an output type.') (
         ('DEFAULT', 'Default format (MSVC Win32 Packed)'),
         ('XML',     'Packed binary XML'),
         ('WIN32'),
         ('AMD64'),
         ('XBOX'),
         ('XBOX360'),
         ('TAGFILE'),
         ('TAGXML',  'TagFile XML')
      )
   ;
   $flags = Execute-Menu ('Select flags.') (
         #('SAVE_DEFAULT',                   'All other flags default to OFF.'),
         ('SAVE_TEXT_FORMAT',               'Use text (usually XML) format; default is binary if available.'),
         ('SAVE_SERIALIZE_IGNORED_MEMBERS', 'Write members which are usually ignored.'),
         ('SAVE_WRITE_ATTRIBUTES',          'Include extended attributes in metadata.'),
         ('SAVE_CONCISE',                   'Omit optional helpful information (e.g. hex floats as text comments).'),
         ('SAVE_TEXT_NUMBERS',              'Floats output as text rather than binary, with a potential loss in precision.')
      ) 1
   ;
   $recurse = Execute-Menu ('Enable file recursion? Default is yes.') (
         ('',   'Enable'),
         ('-n', 'Disable')
      ) 0 1
   ;
   If ($flags.length) {
      $flags = 'SAVE_DEFAULT|' + ($flags -join '|');
   } Else {
      $flags = '';
   }
   #
   Layout-Render;
   & '.\hkxcmd.exe' -v:$type -f $flags $recurse `"$fileSkel`" `"$fileAnim`" `"$fileOut`"
}
function Task-DumpList {
   Layout-Clear;
   Layout-SetHeader(
      Make-Header('HKXCMD'),
      Make-Header('DumpList')
   );
   Layout-SetBody(
      'Dump the transform or float list for a given skeleton.',
      'This is useful when exporting animation to get bone list synchronized with source.'
   );
   $fileIn  = Read-Host "Input file";
   $fileOut = Read-Host "Output file";
   Layout-PushBody('Input file:  ' + $fileIn);
   Layout-PushBody('Output file: ' + $fileOut);
   #
   Layout-Render;
   & '.\hkxcmd.exe' DumpList -i `"$fileIn`" -o `"$fileOut`"
   Pause;
}
function Task-ExportKF {
   Layout-Clear;
   Layout-SetHeader(
      Make-Header('HKXCMD'),
      Make-Header('ExportKF')
   );
   Layout-SetBody(
      'Convert Havok HKX animations to Gamebryo KF animations.',
      #'If you specify a folder instead of an HKX file, all HKX files in the folder will be converted.'
      '(Specifying an entire HKX folder to convert does not work due to an apparent bug in HKXCmd.)'
   );
   $fileSkel  = Read-Host "Input file - skeleton HKX";
   $fileAnim  = Read-Host "Input file - HKX animation";
   $fileOut   = Read-Host "Output file";
   #
   # TODO: Throw error if path starts with - or / since the program will mistake that for a command switch
   #
   # TODO: Program's own documentation is inconsistent: if you specify an animation folder, specifying an 
   #       output folder breaks (program thinks it's too many paths).
   #
   Layout-PushBody('Input file - skeleton NIF: ' + $fileSkel);
   Layout-PushBody('Input file - HKX animation: ' + $fileAnim);
   Layout-PushBody('Output file:   ' + $fileOut);
   $logLevel = Execute-Menu ('Select debug log level.') (
         ('ERROR'),
         ('WARN'),
         ('INFO'),
         ('DEBUG'),
         ('VERBOSE')
      ) 0 1 2
   ;
   Layout-PushBody('Log level:     ' + $logLevel);
   $recurse = '-n';
   If ((Get-Item $fileAnim) -is [System.IO.DirectoryInfo]) {
      $recurse = Execute-Menu ('Scan the entire folder tree, if using a folder?') (
            ('',   'Yes'),
            ('-n', 'No')
         ) 0 0
      ;
      Layout-PushBody('Recurse files: ' + $recurse);
   }
   $nifVersion = '20.2.0.7';
   $nifUserVer1 = 12;
   $nifUserVer2 = 83;
   #
   # NOTE: Must specify -v, -u, and -u2 in order, as when ExportKF encounters one, it 
   # sets the ones that should come after to zero.
   #
   If (Execute-Menu ('Default NIF version is 20.2.0.7 / 12 / 83. Use a different one?') ((0,'No'),(1,'Yes')) 0 0 -eq 1) {
      $nifVersion  = Read-Host "NIF Version (default: 20.2.0.7)";
      $nifUserVer1  = Read-Host "NIF User Ver 1 (default: 12)";
      $nifUserVer2 = Read-Host "NIF User Ver 2 (default: 83)";
   }
   Layout-PushBody("NIF Version: $nifVersion - $nifUserVer1 / $nifUserVer2");
   #
   Layout-Render;
   
   
   # PowerShell's syntax breaks because PowerShell turns 
   # "-d:$myVar" into "-d: $myVar" because PowerShell is 
   # kinda butt
   #
   #& '.\hkxcmd.exe' exportkf -d:$logLevel$recurse -v:$nifVersion -u:$nifUserVer1 -u2:$nifUserVer2 "$fileSkel" "$fileAnim" "$fileOut"
   #& { Write-Host "'.\hkxcmd.exe' $args" } exportkf -d:$logLevel$recurse -v:$nifVersion -u:$nifUserVer1 -u2:$nifUserVer2 "$fileSkel" "$fileAnim" "$fileOut"
   
   function Quote-String($s) {
      Return '"' + $s + '"';
   }
   $cArgs = @('exportkf', "-d:$logLevel$recurse", "-v:$nifVersion", "-u:$nifUserVer1", "-u2:$nifUserVer2", $(Quote-String($fileSkel)), $(Quote-String($fileAnim)), $(Quote-String($fileOut)));
   & '.\hkxcmd.exe' $cArgs
   #Program-ExecuteVerbose('.\hkxcmd.exe' $cArgs)
   
   
   Pause;
}
function Task-Report {
   Layout-Clear;
   Layout-SetHeader(
      Make-Header('HKXCMD'),
      Make-Header('Report')
   );
   Layout-SetBody(
      'Generate a simple report for all supported Havok classes'
   );
   $outDir = Read-Host "Output directory";
   Layout-PushBody('Output directory: ' + $outDir);
   #
   Layout-Render;
   & '.\hkxcmd.exe' Report `"$outDir`"
   Pause;
}

#Cls;
While (Main) {}
