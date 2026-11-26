Add-Type -AssemblyName System.Windows.Forms

# --- 1. MAX THE VOLUME (send 50 volume-up keypresses) ---
for ($i = 0; $i -lt 50; $i++) {
    [System.Windows.Forms.SendKeys]::SendWait([char]175)  # Volume Up
    Start-Sleep -Milliseconds 30
}

# --- 2. UNMUTE + MAX via CoreAudio (belt and suspenders) ---
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
[Guid("5CDF2C82-841E-4546-9722-0CF74078229A"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IAudioEndpointVolume {
    int _0(); int _1(); int _2(); int _3();
    int SetMasterVolumeLevel(float f, Guid g);
    int SetMasterVolumeLevelScalar(float f, Guid g);
    int GetMasterVolumeLevel(out float f);
    int GetMasterVolumeLevelScalar(out float f);
    int _8(); int _9(); int _10(); int _11(); int _12();
    int SetMute(bool m, Guid g);
    int GetMute(out bool m);
}
[Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice {
    int Activate(ref Guid id, int ctx, IntPtr p, out IAudioEndpointVolume ep);
}
[Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator {
    int _0();
    int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice dev);
}
[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")]
class MMDeviceEnumeratorComObject { }
public class Audio {
    static IAudioEndpointVolume Vol() {
        var enumerator = new MMDeviceEnumeratorComObject() as IMMDeviceEnumerator;
        IMMDevice dev; enumerator.GetDefaultAudioEndpoint(0, 1, out dev);
        Guid iid = typeof(IAudioEndpointVolume).GUID;
        IAudioEndpointVolume ep; dev.Activate(ref iid, 23, IntPtr.Zero, out ep);
        return ep;
    }
    public static void Max() {
        var v = Vol();
        Guid g = Guid.Empty;
        v.SetMute(false, g);
        v.SetMasterVolumeLevelScalar(1.0f, g);
    }
}
"@
[Audio]::Max()

# --- 3. THE TAB LIST (30 direct video / video-page URLs) ---
$urls = @(
    # e621 - direct .webm/.mp4 sample videos (play with sound)
    "https://e621.net/posts?tags=order:random+type:webm+furry",
    "https://e621.net/posts?tags=order:random+type:mp4",
    "https://e621.net/posts?tags=order:random+animated",
    "https://e621.net/posts?tags=order:random+sound",
    "https://e621.net/posts?tags=order:random+animated+sound",
    # Pornhub furry tag pages (autoplay previews w/ sound on hover)
    "https://www.pornhub.com/video/search?search=furry",
    "https://www.pornhub.com/video/search?search=furry+animated",
    "https://www.pornhub.com/video/search?search=furry+yiff",
    "https://www.pornhub.com/video/search?search=furry+3d",
    "https://www.pornhub.com/video/search?search=knotting",
    "https://www.pornhub.com/video/search?search=furry+creampie",
    "https://www.pornhub.com/video/search?search=anthro",
    "https://www.pornhub.com/video/search?search=furry+lesbian",
    "https://www.pornhub.com/video/search?search=furry+gay",
    # xVideos furry
    "https://www.xvideos.com/?k=furry",
    "https://www.xvideos.com/?k=furry+animated",
    "https://www.xvideos.com/?k=furry+3d",
    "https://www.xvideos.com/?k=yiff",
    # FurAffinity video/animations
    "https://www.furaffinity.net/browse/?type=1&cat=2",
    "https://www.furaffinity.net/search/?q=animated",
    "https://www.furaffinity.net/search/?q=webm",
    # Rule34 video
    "https://rule34video.com/search/furry/",
    "https://rule34video.com/search/furry+animated/",
    "https://rule34video.com/search/knotting/",
    # e621 more variety
    "https://e621.net/posts?tags=order:random+animated+rating:e",
    "https://e621.net/posts?tags=order:random+webm+rating:e",
    "https://e621.net/posts?tags=order:random+mp4+rating:e",
    "https://e621.net/posts?tags=order:random+sound+rating:e",
    # Misc
    "https://www.pornhub.com/video/search?search=furry+compilation",
    "https://www.pornhub.com/video/search?search=furry+pov"
)

# --- 4. FIRE THE TABS ---
foreach ($u in $urls) {
    Start-Process $u
    Start-Sleep -Milliseconds 250   # stagger so browser doesn't choke
}

Write-Host "`n30 furry tabs fired. Volume maxed. Enjoy. 🐺" -ForegroundColor Magenta
