; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [434 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [868 x i64] [
	i64 17802880886401652, ; 0: tr/Microsoft.VisualStudio.Threading.resources.dll => 0x3f3fa037366a74 => 390
	i64 24362543149721218, ; 1: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 252
	i64 33071413975074826, ; 2: Microsoft.VisualStudio.RemoteControl => 0x757e469a34480a => 195
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 184
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 170
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 189
	i64 177794975121655083, ; 6: ja/Microsoft.VisualStudio.Utilities.resources.dll => 0x277a7967ef9c52b => 399
	i64 196720943101637631, ; 7: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210390243030528795, ; 8: ru/Microsoft.ServiceHub.Resources.dll => 0x2eb74cfb40af31b => 363
	i64 210515253464952879, ; 9: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 239
	i64 229794953483747371, ; 10: System.ValueTuple.dll => 0x330654aed93802b => 150
	i64 232391251801502327, ; 11: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 280
	i64 279670469376841020, ; 12: zh-Hant\Microsoft.VisualStudio.Composition.resources => 0x3e196cf655f953c => 379
	i64 295915112840604065, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 283
	i64 311281864840114177, ; 14: ja\Microsoft.VisualStudio.Utilities.resources => 0x451e534f2d0f001 => 399
	i64 316157742385208084, ; 15: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 246
	i64 350667413455104241, ; 16: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 390014653889418737, ; 17: ja/Microsoft.VisualStudio.Validation.resources.dll => 0x5699c42e64695f1 => 412
	i64 408699061380389292, ; 18: Microsoft.VisualStudio.Utilities => 0x5abfda1859d19ac => 199
	i64 422779754995088667, ; 19: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 20: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 282
	i64 449765079935339303, ; 21: StreamJsonRpc.dll => 0x63de2f50debcb27 => 205
	i64 486738060028624626, ; 22: es/Microsoft.ServiceHub.Framework.resources.dll => 0x6c13dafceab3ef2 => 343
	i64 502670939551102150, ; 23: System.Management.dll => 0x6f9d88e66daf4c6 => 218
	i64 545109961164950392, ; 24: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 314
	i64 560278790331054453, ; 25: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 602010118039455382, ; 26: zh-Hans\Microsoft.VisualStudio.Utilities.resources => 0x85ac50344eec696 => 405
	i64 634308326490598313, ; 27: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 265
	i64 649145001856603771, ; 28: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 675799254782331204, ; 29: ko/Microsoft.VisualStudio.Threading.resources.dll => 0x960ebd778c64944 => 386
	i64 676272570642346617, ; 30: fr/Microsoft.ServiceHub.Resources.dll => 0x9629a51e87a3279 => 357
	i64 702024105029695270, ; 31: System.Drawing.Common => 0x9be17343c0e7726 => 216
	i64 750875890346172408, ; 32: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 144
	i64 775433664847856186, ; 33: it\Microsoft.VisualStudio.Composition.resources => 0xac2e4cf4c22c23a => 371
	i64 790155713624325618, ; 34: ru\Microsoft.ServiceHub.Framework.resources => 0xaf7326f63d2bdf2 => 350
	i64 798450721097591769, ; 35: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 240
	i64 799765834175365804, ; 36: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 807768407251849530, ; 37: zh-Hans\Microsoft.VisualStudio.Validation.resources => 0xb35c5162f07913a => 418
	i64 849051935479314978, ; 38: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 317
	i64 872800313462103108, ; 39: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 251
	i64 895210737996778430, ; 40: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 266
	i64 940822596282819491, ; 41: System.Transactions => 0xd0e792aa81923a3 => 149
	i64 960778385402502048, ; 42: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 43: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 44: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 295
	i64 1121665720830085036, ; 45: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 325
	i64 1166741338400454851, ; 46: zh-Hant/Microsoft.VisualStudio.Validation.resources.dll => 0x10311910cc1f78c3 => 419
	i64 1182549588684364891, ; 47: zh-Hans\Microsoft.VisualStudio.Threading.resources => 0x10694295e2d0dc5b => 391
	i64 1268860745194512059, ; 48: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 49: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 50: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 235
	i64 1369545283391376210, ; 51: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 273
	i64 1404195534211153682, ; 52: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 53: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 54: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 55: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 186
	i64 1492954217099365037, ; 56: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 57: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 169
	i64 1534910729791260118, ; 58: zh-Hans/Microsoft.ServiceHub.Framework.resources.dll => 0x154d192d2b24c5d6 => 352
	i64 1537168428375924959, ; 59: System.Threading.Thread.dll => 0x15551e8a954ae0df => 144
	i64 1556147632182429976, ; 60: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 323
	i64 1576750169145655260, ; 61: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 294
	i64 1624659445732251991, ; 62: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 234
	i64 1628611045998245443, ; 63: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 269
	i64 1636321030536304333, ; 64: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 259
	i64 1651782184287836205, ; 65: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 66: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1660779948839220459, ; 67: it/Microsoft.VisualStudio.Threading.resources.dll => 0x170c469074a734eb => 384
	i64 1682513316613008342, ; 68: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1731380447121279447, ; 69: Newtonsoft.Json => 0x18071957e9b889d7 => 204
	i64 1735388228521408345, ; 70: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 71: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 72: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 73: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 233
	i64 1825687700144851180, ; 74: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 75: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 313
	i64 1836611346387731153, ; 76: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 280
	i64 1854145951182283680, ; 77: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 78: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 79: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 230
	i64 1881198190668717030, ; 80: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 335
	i64 1897575647115118287, ; 81: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 282
	i64 1911806496241183156, ; 82: tr\Microsoft.VisualStudio.Utilities.resources => 0x1a8819e10fbd69b4 => 404
	i64 1920760634179481754, ; 83: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 187
	i64 1930726298510463061, ; 84: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 172
	i64 1959996714666907089, ; 85: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 335
	i64 1972385128188460614, ; 86: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 87: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 267
	i64 1983698669889758782, ; 88: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 309
	i64 2019660174692588140, ; 89: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 327
	i64 2040001226662520565, ; 90: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 141
	i64 2062890601515140263, ; 91: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 140
	i64 2064708342624596306, ; 92: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 303
	i64 2080945842184875448, ; 93: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 94: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 95: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 140
	i64 2130792593772371839, ; 96: es/Microsoft.ServiceHub.Resources.dll => 0x1d92189319d5df7f => 356
	i64 2133195048986300728, ; 97: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 204
	i64 2141794003861218914, ; 98: cs/Microsoft.VisualStudio.Validation.resources.dll => 0x1db92e4c7e35a662 => 407
	i64 2165310824878145998, ; 99: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 227
	i64 2165725771938924357, ; 100: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 237
	i64 2200176636225660136, ; 101: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 182
	i64 2262844636196693701, ; 102: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 251
	i64 2283599909513827695, ; 103: pt-BR/Microsoft.VisualStudio.Validation.resources.dll => 0x1fb0fa04c7af956f => 415
	i64 2287834202362508563, ; 104: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 105: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 106: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 331
	i64 2304837677853103545, ; 107: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 279
	i64 2315304989185124968, ; 108: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 109: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 262
	i64 2335283022205148317, ; 110: ko\Microsoft.VisualStudio.Composition.resources => 0x206897892c89dc9d => 373
	i64 2335503487726329082, ; 111: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 112: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2423932764996432979, ; 113: es/Microsoft.VisualStudio.Utilities.resources.dll => 0x21a38a01d90af453 => 396
	i64 2430359805989914396, ; 114: ko\Microsoft.VisualStudio.Utilities.resources => 0x21ba5f5df06a871c => 400
	i64 2470498323731680442, ; 115: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 244
	i64 2479423007379663237, ; 116: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 289
	i64 2497223385847772520, ; 117: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 118: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 228
	i64 2592350477072141967, ; 119: System.Xml.dll => 0x23f9e10627330e8f => 162
	i64 2602673633151553063, ; 120: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 334
	i64 2624866290265602282, ; 121: mscorlib.dll => 0x246d65fbde2db8ea => 165
	i64 2632269733008246987, ; 122: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 123: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 178
	i64 2662981627730767622, ; 124: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 309
	i64 2704260652175460545, ; 125: System.Composition.Convention => 0x258776bc40fc08c1 => 209
	i64 2706075432581334785, ; 126: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2783046991838674048, ; 127: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 128: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 284
	i64 2796533598066548032, ; 129: de\Microsoft.ServiceHub.Resources => 0x26cf487da3339d40 => 355
	i64 2815524396660695947, ; 130: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2844780895111324988, ; 131: System.Composition.TypedParts => 0x277ab126dceda53c => 212
	i64 2851879596360956261, ; 132: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 213
	i64 2874659109084101369, ; 133: de/Microsoft.VisualStudio.Validation.resources.dll => 0x27e4d73aa74c7af9 => 408
	i64 2895129759130297543, ; 134: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 314
	i64 2923871038697555247, ; 135: Jsr305Binding => 0x2893ad37e69ec52f => 296
	i64 2957510711280508021, ; 136: zh-Hant/Microsoft.VisualStudio.Threading.resources.dll => 0x290b305285499c75 => 392
	i64 2991907748835029057, ; 137: de/StreamJsonRpc.resources.dll => 0x2985643eea0cf041 => 421
	i64 3017136373564924869, ; 138: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 139: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 295
	i64 3106852385031680087, ; 140: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 141: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 142: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3216235690883836477, ; 143: cs/Microsoft.VisualStudio.Utilities.resources.dll => 0x2ca25d520d106a3d => 393
	i64 3238539556702659506, ; 144: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 202
	i64 3281594302220646930, ; 145: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 146: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 260
	i64 3303437397778967116, ; 147: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 231
	i64 3311221304742556517, ; 148: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 149: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 150: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3341463492655001636, ; 151: it\Microsoft.ServiceHub.Framework.resources => 0x2e5f4357bda33024 => 345
	i64 3344514922410554693, ; 152: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 306
	i64 3373397458776442943, ; 153: tr/Microsoft.ServiceHub.Resources.dll => 0x2ed0b71da093483f => 364
	i64 3378246407733840341, ; 154: pl\Microsoft.VisualStudio.Threading.resources => 0x2ee1f13588b709d5 => 387
	i64 3429672777697402584, ; 155: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 189
	i64 3437845325506641314, ; 156: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 157: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 286
	i64 3494946837667399002, ; 158: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 176
	i64 3508450208084372758, ; 159: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 160: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 285
	i64 3531994851595924923, ; 161: System.Numerics => 0x31042a9aade235bb => 83
	i64 3532505434160716017, ; 162: pt-BR\Microsoft.ServiceHub.Framework.resources => 0x3105faf9f24958f1 => 349
	i64 3551103847008531295, ; 163: System.Private.CoreLib.dll => 0x31480e226177735f => 171
	i64 3567343442040498961, ; 164: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 329
	i64 3571415421602489686, ; 165: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 166: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 177
	i64 3647754201059316852, ; 167: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 155
	i64 3655542548057982301, ; 168: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 176
	i64 3659371656528649588, ; 169: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 225
	i64 3690127606734143618, ; 170: fr/Microsoft.VisualStudio.Validation.resources.dll => 0x3335f781d7404082 => 410
	i64 3716579019761409177, ; 171: netstandard.dll => 0x3393f0ed5c8c5c99 => 166
	i64 3727469159507183293, ; 172: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 278
	i64 3745789886814214634, ; 173: ko\Microsoft.ServiceHub.Framework.resources => 0x33fbb80e56cfd9ea => 347
	i64 3772598417116884899, ; 174: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 252
	i64 3774851544379141081, ; 175: it\Microsoft.ServiceHub.Resources => 0x3462f77ac68dabd9 => 358
	i64 3808596350265393157, ; 176: System.Diagnostics.PerformanceCounter.dll => 0x34dada33a66b0005 => 215
	i64 3829576749922459295, ; 177: cs/Microsoft.ServiceHub.Framework.resources.dll => 0x352563c39b391e9f => 341
	i64 3869221888984012293, ; 178: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 180
	i64 3869649043256705283, ; 179: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3875180953283865480, ; 180: MessagePack.dll => 0x35c7688ba0d82b88 => 174
	i64 3890352374528606784, ; 181: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 187
	i64 3892323582453208937, ; 182: ko/Microsoft.VisualStudio.Utilities.resources.dll => 0x36044fad02ffd769 => 400
	i64 3919223565570527920, ; 183: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 184: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 185: System.Memory => 0x370b03412596249e => 62
	i64 3986466921713458903, ; 186: System.Composition.Hosting => 0x3752c68b49935ed7 => 210
	i64 4006972109285359177, ; 187: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 160
	i64 4009997192427317104, ; 188: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4020380517496724220, ; 189: MessagePack.Annotations.dll => 0x37cb42c79f4b1afc => 175
	i64 4073500526318903918, ; 190: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 191: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 185
	i64 4120493066591692148, ; 192: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 340
	i64 4148881117810174540, ; 193: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 194: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 195: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 145
	i64 4168469861834746866, ; 196: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 197: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 198: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 246
	i64 4205801962323029395, ; 199: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4224288942162558427, ; 200: Microsoft.VisualStudio.Composition.dll => 0x3a9fb0696235bddb => 194
	i64 4235503420553921860, ; 201: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4237761919127609754, ; 202: tr\Microsoft.ServiceHub.Resources => 0x3acf8e034847619a => 364
	i64 4282138915307457788, ; 203: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4321865999928413850, ; 204: System.Diagnostics.EventLog.dll => 0x3bfa5a3a8c924e9a => 214
	i64 4356591372459378815, ; 205: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 337
	i64 4373617458794931033, ; 206: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4397634830160618470, ; 207: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4462330757387019284, ; 208: Microsoft.ServiceHub.Resources => 0x3ded622e705a6414 => 193
	i64 4477672992252076438, ; 209: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 151
	i64 4484706122338676047, ; 210: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 211: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4537536889469555869, ; 212: es/Microsoft.VisualStudio.Composition.resources.dll => 0x3ef891c29410549d => 369
	i64 4636684751163556186, ; 213: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 290
	i64 4654490921503260514, ; 214: fr\Microsoft.VisualStudio.Validation.resources => 0x409812d5227b7f62 => 410
	i64 4672453897036726049, ; 215: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 216: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 307
	i64 4692118866197340027, ; 217: pl/Microsoft.VisualStudio.Composition.resources.dll => 0x411dc13fb799df7b => 374
	i64 4716677666592453464, ; 218: System.Xml.XmlSerializer => 0x417501590542f358 => 161
	i64 4723252672199750351, ; 219: zh-Hant\StreamJsonRpc.resources => 0x418c5d47cee172cf => 432
	i64 4743821336939966868, ; 220: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 221: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 264
	i64 4794310189461587505, ; 222: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 228
	i64 4795410492532947900, ; 223: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 285
	i64 4809057822547766521, ; 224: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 225: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 226: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 4952488434027013261, ; 227: pl/Microsoft.VisualStudio.Validation.resources.dll => 0x44bac5fdc869248d => 414
	i64 4966213257581017890, ; 228: it\Microsoft.VisualStudio.Threading.resources => 0x44eb88a548f3bb22 => 384
	i64 5002337827157170690, ; 229: zh-Hant\Microsoft.ServiceHub.Resources => 0x456bdfc01233da02 => 366
	i64 5051607678629112937, ; 230: es\Microsoft.ServiceHub.Framework.resources => 0x461aea6b4d52ec69 => 343
	i64 5055365687667823624, ; 231: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 229
	i64 5072195939344590231, ; 232: cs/Microsoft.VisualStudio.Threading.resources.dll => 0x46640f554bd02597 => 380
	i64 5081566143765835342, ; 233: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 234: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 235: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 236: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 237: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 271
	i64 5244375036463807528, ; 238: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 239: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 240: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 241: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 263
	i64 5287793306032704698, ; 242: zh-Hans/Microsoft.ServiceHub.Resources.dll => 0x496203fef3c48cba => 365
	i64 5290786973231294105, ; 243: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5313674019156125223, ; 244: de\Microsoft.ServiceHub.Framework.resources => 0x49bdf65e0c05e627 => 342
	i64 5340835533783596017, ; 245: cs/Microsoft.ServiceHub.Resources.dll => 0x4a1e759efaf47bf1 => 354
	i64 5376510917114486089, ; 246: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 289
	i64 5408338804355907810, ; 247: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 287
	i64 5423376490970181369, ; 248: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5424449234786381625, ; 249: cs\Microsoft.VisualStudio.Validation.resources => 0x4b4783d6cd94ef39 => 407
	i64 5435342863934572396, ; 250: ru/Microsoft.VisualStudio.Utilities.resources.dll => 0x4b6e37897d46476c => 403
	i64 5440320908473006344, ; 251: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 252: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 253: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 242
	i64 5457765010617926378, ; 254: System.Xml.Serialization => 0x4bbde05c557002ea => 156
	i64 5471532531798518949, ; 255: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 333
	i64 5488847537322884930, ; 256: System.Windows.Extensions => 0x4c2c4dc108687f42 => 223
	i64 5499883080459888738, ; 257: Microsoft.VisualStudio.Threading => 0x4c538285a4fe2862 => 198
	i64 5507995362134886206, ; 258: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 259: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 336
	i64 5527431512186326818, ; 260: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 261: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 262: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 263: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 232
	i64 5591791169662171124, ; 264: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5635158070688529302, ; 265: es/Microsoft.VisualStudio.Validation.resources.dll => 0x4e341a68b090bb96 => 409
	i64 5650097808083101034, ; 266: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5676263520774316728, ; 267: Microsoft.VisualStudio.Validation => 0x4ec623991742e2b8 => 201
	i64 5681707193364847894, ; 268: pt-BR/StreamJsonRpc.resources.dll => 0x4ed97a96e24b1d16 => 428
	i64 5692067934154308417, ; 269: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 292
	i64 5724799082821825042, ; 270: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 255
	i64 5757522595884336624, ; 271: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 241
	i64 5783556987928984683, ; 272: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5815588864042668787, ; 273: de\StreamJsonRpc.resources => 0x50b51f4270fb12f3 => 421
	i64 5896680224035167651, ; 274: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 261
	i64 5924126145606300664, ; 275: pl\StreamJsonRpc.resources => 0x5236b9579177b3f8 => 427
	i64 5959344983920014087, ; 276: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 281
	i64 5979151488806146654, ; 277: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 278: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 279: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 330
	i64 6102788177522843259, ; 280: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 281
	i64 6200764641006662125, ; 281: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 330
	i64 6222399776351216807, ; 282: System.Text.Json.dll => 0x565a67a0ffe264a7 => 221
	i64 6251069312384999852, ; 283: System.Transactions.Local => 0x56c0426b870da1ac => 148
	i64 6278736998281604212, ; 284: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 285: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6315590403487358180, ; 286: fr\StreamJsonRpc.resources => 0x57a57c02b2badce4 => 423
	i64 6319713645133255417, ; 287: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 265
	i64 6355862529564748107, ; 288: Microsoft.ServiceHub.Resources.dll => 0x58348f4bbbec294b => 193
	i64 6357457916754632952, ; 289: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 433
	i64 6401687960814735282, ; 290: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 262
	i64 6435971861494892919, ; 291: cs/StreamJsonRpc.resources.dll => 0x59512a4f0cd00977 => 420
	i64 6474126617406440626, ; 292: Microsoft.VisualStudio.RpcContracts.dll => 0x59d8b7db6d6984b2 => 196
	i64 6478287442656530074, ; 293: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 318
	i64 6504860066809920875, ; 294: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 237
	i64 6548213210057960872, ; 295: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 248
	i64 6557084851308642443, ; 296: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 293
	i64 6560151584539558821, ; 297: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 183
	i64 6589202984700901502, ; 298: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 298
	i64 6591971792923354531, ; 299: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 263
	i64 6617685658146568858, ; 300: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6692579329111691486, ; 301: it/Microsoft.VisualStudio.Composition.resources.dll => 0x5ce0d170e6d310de => 371
	i64 6713049226152416138, ; 302: cs\Microsoft.VisualStudio.Threading.resources => 0x5d298ab43486938a => 380
	i64 6713440830605852118, ; 303: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739246970287767386, ; 304: tr/StreamJsonRpc.resources.dll => 0x5d869d69d5a13f5a => 430
	i64 6739853162153639747, ; 305: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 306: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 326
	i64 6746589141607518456, ; 307: pt-BR/Microsoft.VisualStudio.Utilities.resources.dll => 0x5da0b3144f0610f8 => 402
	i64 6766076348542393491, ; 308: Microsoft.ServiceHub.Framework.dll => 0x5de5ee973e0a9c93 => 192
	i64 6772837112740759457, ; 309: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 310: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 329
	i64 6786606130239981554, ; 311: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6791396597476077909, ; 312: de/Microsoft.VisualStudio.Utilities.resources.dll => 0x5e3fe339195bb155 => 394
	i64 6798329586179154312, ; 313: System.Windows => 0x5e5884bd523ca188 => 153
	i64 6814185388980153342, ; 314: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 157
	i64 6876862101832370452, ; 315: System.Xml.Linq => 0x5f6f85a57d108914 => 154
	i64 6894844156784520562, ; 316: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6987056692196838363, ; 317: System.Management => 0x60f7030ae3e88bdb => 218
	i64 7011053663211085209, ; 318: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 257
	i64 7014127154236225539, ; 319: ru\Microsoft.ServiceHub.Resources => 0x61572f7bfdabf803 => 363
	i64 7060896174307865760, ; 320: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 142
	i64 7083547580668757502, ; 321: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 322: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 323: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 258
	i64 7112547816752919026, ; 324: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7118095232192617785, ; 325: tr\Microsoft.VisualStudio.Composition.resources => 0x62c88de6803e1d39 => 377
	i64 7188876148444261747, ; 326: System.Composition.AttributedModel.dll => 0x63c404c4ca4c6d73 => 208
	i64 7192745174564810625, ; 327: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 227
	i64 7220009545223068405, ; 328: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 333
	i64 7270811800166795866, ; 329: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7284491514466782135, ; 330: pt-BR\Microsoft.ServiceHub.Resources => 0x6517b6700123cbb7 => 362
	i64 7299370801165188114, ; 331: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 332: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 333: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 334: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 226
	i64 7371656174704040109, ; 335: ru\Microsoft.VisualStudio.Composition.resources => 0x664d623bf38c98ad => 376
	i64 7377312882064240630, ; 336: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 337: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 154
	i64 7489048572193775167, ; 338: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7584834483252033044, ; 339: pt-BR\Microsoft.VisualStudio.Validation.resources => 0x6942bec6be5ef614 => 415
	i64 7592577537120840276, ; 340: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7635299587268401828, ; 341: ja/Microsoft.ServiceHub.Framework.resources.dll => 0x69f6088564d1daa4 => 346
	i64 7637303409920963731, ; 342: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7643889328271876492, ; 343: fr\Microsoft.VisualStudio.Composition.resources => 0x6a148cd8520b618c => 370
	i64 7654504624184590948, ; 344: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7683996460257074599, ; 345: it\Microsoft.VisualStudio.Validation.resources => 0x6aa30a11acfb5da7 => 411
	i64 7692844685477678523, ; 346: de\Microsoft.VisualStudio.Composition.resources => 0x6ac2797ba6260dbb => 368
	i64 7694700312542370399, ; 347: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 348: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 324
	i64 7714652370974252055, ; 349: System.Private.CoreLib => 0x6b0ff375198b9c17 => 171
	i64 7725404731275645577, ; 350: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 266
	i64 7735176074855944702, ; 351: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 352: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 301
	i64 7791074099216502080, ; 353: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 354: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 355: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 234
	i64 7889145416849571422, ; 356: fr/Microsoft.VisualStudio.Composition.resources.dll => 0x6d7bdff548b83e5e => 370
	i64 7921741049276291146, ; 357: ja/Microsoft.VisualStudio.Threading.resources.dll => 0x6defad835cbe584a => 385
	i64 8020916254412992903, ; 358: zh-Hant/Microsoft.ServiceHub.Resources.dll => 0x6f5004d635717187 => 366
	i64 8025517457475554965, ; 359: WindowsBase => 0x6f605d9b4786ce95 => 164
	i64 8031450141206250471, ; 360: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8037258329461389554, ; 361: ru/StreamJsonRpc.resources.dll => 0x6f8a13de0f9878f2 => 429
	i64 8044118961405839122, ; 362: System.ComponentModel.Composition => 0x6fa2739369944712 => 207
	i64 8064050204834738623, ; 363: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 364: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 260
	i64 8085230611270010360, ; 365: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 366: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 367: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 368: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 369: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 167
	i64 8185542183669246576, ; 370: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 371: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 305
	i64 8199901720993286004, ; 372: pl/StreamJsonRpc.resources.dll => 0x71cbe72b98eb4774 => 427
	i64 8202143405964630621, ; 373: de\Microsoft.VisualStudio.Threading.resources => 0x71d3ddf88d559a5d => 381
	i64 8246048515196606205, ; 374: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 190
	i64 8264926008854159966, ; 375: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 376: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8311982169281665208, ; 377: System.Threading.AccessControl => 0x735a17be836a18b8 => 222
	i64 8318905602908530212, ; 378: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 379: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 380: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 243
	i64 8400357532724379117, ; 381: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 275
	i64 8406449386989781371, ; 382: pt-BR/Microsoft.VisualStudio.Composition.resources.dll => 0x74a9b52d9dd3817b => 375
	i64 8410671156615598628, ; 383: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 384: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 264
	i64 8445070827284110693, ; 385: Microsoft.VisualStudio.Utilities.Internal => 0x7532eb2c6b489d65 => 200
	i64 8476857680833348370, ; 386: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 220
	i64 8518412311883997971, ; 387: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8540594166003620310, ; 388: ko/Microsoft.ServiceHub.Framework.resources.dll => 0x76864924db6b59d6 => 347
	i64 8563666267364444763, ; 389: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8568254372587209012, ; 390: it/Microsoft.VisualStudio.Utilities.resources.dll => 0x76e88df48f3f8134 => 398
	i64 8575739357155667659, ; 391: zh-Hant\Microsoft.VisualStudio.Utilities.resources => 0x770325825599aecb => 406
	i64 8595034769595574800, ; 392: ja\Microsoft.VisualStudio.Threading.resources => 0x7747b295a1e02a10 => 385
	i64 8598790081731763592, ; 393: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 254
	i64 8601935802264776013, ; 394: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 287
	i64 8605570381828407308, ; 395: en/Microsoft.VisualStudio.Utilities.resources.dll => 0x776d20ab0281400c => 395
	i64 8614108721271900878, ; 396: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 328
	i64 8623059219396073920, ; 397: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 398: Java.Interop => 0x77b654e585b55834 => 167
	i64 8638972117149407195, ; 399: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 400: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 274
	i64 8648495978913578441, ; 401: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 402: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 328
	i64 8684531736582871431, ; 403: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 404: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8740830839790451704, ; 405: fr\Microsoft.ServiceHub.Framework.resources => 0x794dab567f7d3bf8 => 344
	i64 8772037756965498393, ; 406: it/Microsoft.VisualStudio.Validation.resources.dll => 0x79bc89dd1c3e2e19 => 411
	i64 8825974560710680624, ; 407: pl/Microsoft.ServiceHub.Framework.resources.dll => 0x7a7c2919d7cb6030 => 348
	i64 8853378295825400934, ; 408: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 302
	i64 8907357455289697290, ; 409: es/Microsoft.VisualStudio.Threading.resources.dll => 0x7b9d4a6991f8440a => 382
	i64 8941376889969657626, ; 410: System.Xml.XDocument => 0x7c1626e87187471a => 157
	i64 8945671042233212356, ; 411: Mockup.dll => 0x7c25686aadcf1dc4 => 0
	i64 8951477988056063522, ; 412: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 277
	i64 8954753533646919997, ; 413: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 8993496018399434829, ; 414: de/Microsoft.ServiceHub.Framework.resources.dll => 0x7ccf50faa996984d => 342
	i64 9045785047181495996, ; 415: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 338
	i64 9138683372487561558, ; 416: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9171069561746690957, ; 417: it\StreamJsonRpc.resources => 0x7f462f2d0e4f138d => 424
	i64 9312692141327339315, ; 418: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 292
	i64 9324707631942237306, ; 419: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 233
	i64 9360039450522429843, ; 420: fr/Microsoft.ServiceHub.Framework.resources.dll => 0x81e58a49e4082993 => 344
	i64 9468215723722196442, ; 421: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 158
	i64 9554839972845591462, ; 422: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 423: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 297
	i64 9584643793929893533, ; 424: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9630107140230300349, ; 425: de\Microsoft.VisualStudio.Validation.resources => 0x85a5036bea6142bd => 408
	i64 9659729154652888475, ; 426: System.Text.RegularExpressions => 0x860e407c9991dd9b => 137
	i64 9662334977499516867, ; 427: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 428: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 429: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 244
	i64 9679978064620295023, ; 430: it/StreamJsonRpc.resources.dll => 0x865630c35744136f => 424
	i64 9702891218465930390, ; 431: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9776375771063220978, ; 432: Nerdbank.Streams => 0x87aca9f760f57af2 => 203
	i64 9780093022148426479, ; 433: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 294
	i64 9808709177481450983, ; 434: Mono.Android.dll => 0x881f890734e555e7 => 170
	i64 9823691751235222432, ; 435: zh-Hant\Microsoft.ServiceHub.Framework.resources => 0x8854c3997f4f7ba0 => 353
	i64 9825649861376906464, ; 436: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 241
	i64 9827080095733250167, ; 437: zh-Hant/Microsoft.ServiceHub.Framework.resources.dll => 0x8860cd47ed7df877 => 353
	i64 9834056768316610435, ; 438: System.Transactions.dll => 0x8879968718899783 => 149
	i64 9836529246295212050, ; 439: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9844193899530095610, ; 440: ja\Microsoft.VisualStudio.Validation.resources => 0x889d9a31e18f0bfa => 412
	i64 9907349773706910547, ; 441: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 254
	i64 9933555792566666578, ; 442: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 443: Microsoft.Maui => 0x8a2b8315b36616ac => 188
	i64 9959489431142554298, ; 444: System.CodeDom => 0x8a3736deb7825aba => 206
	i64 9963664739326433656, ; 445: zh-Hans\Microsoft.ServiceHub.Framework.resources => 0x8a460c4a68a31978 => 352
	i64 9974604633896246661, ; 446: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 156
	i64 9976963888860496507, ; 447: Microsoft.VisualStudio.Telemetry.dll => 0x8a754bcbf46e027b => 197
	i64 9991543690424095600, ; 448: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 313
	i64 10017511394021241210, ; 449: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 182
	i64 10038780035334861115, ; 450: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 451: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 452: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 453: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 454: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 186
	i64 10105485790837105934, ; 455: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 142
	i64 10143853363526200146, ; 456: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 310
	i64 10151361150077311800, ; 457: Microsoft.VisualStudio.Utilities.Internal.dll => 0x8ce0e12e890f1b38 => 200
	i64 10224491876966872357, ; 458: ko/Microsoft.VisualStudio.Composition.resources.dll => 0x8de4b130bf7a3525 => 373
	i64 10226222362177979215, ; 459: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 303
	i64 10229024438826829339, ; 460: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 248
	i64 10236703004850800690, ; 461: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 462: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 463: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 300
	i64 10360651442923773544, ; 464: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 465: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 466: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 286
	i64 10406448008575299332, ; 467: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 306
	i64 10407550536276267806, ; 468: zh-Hant/Microsoft.VisualStudio.Composition.resources.dll => 0x906f0c1238ac531e => 379
	i64 10430153318873392755, ; 469: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 245
	i64 10447615475279048428, ; 470: de\Microsoft.VisualStudio.Utilities.resources => 0x90fd62ebc1e1aeec => 394
	i64 10448061532586656644, ; 471: System.Composition.Convention.dll => 0x90fef89b91404384 => 209
	i64 10505221885553605938, ; 472: ja/Microsoft.VisualStudio.Composition.resources.dll => 0x91ca0ba55714fd32 => 372
	i64 10506226065143327199, ; 473: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 308
	i64 10546663366131771576, ; 474: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 475: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 476: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 158
	i64 10670374202010151210, ; 477: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 478: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10785150219063592792, ; 479: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 480: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 481: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10835442135346987677, ; 482: pl/Microsoft.VisualStudio.Utilities.resources.dll => 0x965f3936a5a8429d => 401
	i64 10843446450579966237, ; 483: Microsoft.VisualStudio.Composition => 0x967ba91883ca091d => 194
	i64 10847732767863316357, ; 484: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 235
	i64 10899834349646441345, ; 485: System.Web => 0x9743fd975946eb81 => 152
	i64 10943875058216066601, ; 486: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 487: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 10991732737396536896, ; 488: zh-Hant/Microsoft.VisualStudio.Utilities.resources.dll => 0x988a7ab01e8d7640 => 406
	i64 11002576679268595294, ; 489: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 181
	i64 11009005086950030778, ; 490: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 188
	i64 11019817191295005410, ; 491: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 232
	i64 11023048688141570732, ; 492: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 493: System.Xml => 0x992e31d0412bf7fc => 162
	i64 11047101296015504039, ; 494: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 202
	i64 11071824625609515081, ; 495: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 298
	i64 11078422477095414952, ; 496: MessagePack.Annotations => 0x99be768c02f9aca8 => 175
	i64 11079569176516935993, ; 497: ko\Microsoft.ServiceHub.Resources => 0x99c28976c6a8c139 => 360
	i64 11103970607964515343, ; 498: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 319
	i64 11128108736298314439, ; 499: ja\Microsoft.ServiceHub.Resources => 0x9a6efbefb8fb6ac7 => 359
	i64 11129765940661776577, ; 500: es\Microsoft.VisualStudio.Composition.resources => 0x9a74df27ae62f0c1 => 369
	i64 11136029745144976707, ; 501: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 296
	i64 11138965398324199724, ; 502: ru/Microsoft.VisualStudio.Composition.resources.dll => 0x9a958e03547b412c => 376
	i64 11162124722117608902, ; 503: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 291
	i64 11188319605227840848, ; 504: System.Threading.Overlapped => 0x9b44e5671724e550 => 139
	i64 11220793807500858938, ; 505: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 322
	i64 11226290749488709958, ; 506: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 183
	i64 11235648312900863002, ; 507: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11329751333533450475, ; 508: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 146
	i64 11340910727871153756, ; 509: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 247
	i64 11341245327015630248, ; 510: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 213
	i64 11347436699239206956, ; 511: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 161
	i64 11385656703440359675, ; 512: zh-Hant\Microsoft.VisualStudio.Validation.resources => 0x9e01fa72af1b90fb => 419
	i64 11392833485892708388, ; 513: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 276
	i64 11426995335776520728, ; 514: it/Microsoft.ServiceHub.Resources.dll => 0x9e94d7b70f014a18 => 358
	i64 11432086877643258359, ; 515: cs\Microsoft.ServiceHub.Resources => 0x9ea6ee720754b9f7 => 354
	i64 11432101114902388181, ; 516: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 517: Mono.Android.Export => 0x9edabf8623efc131 => 168
	i64 11448276831755070604, ; 518: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11465237565819292444, ; 519: ru/Microsoft.VisualStudio.Threading.resources.dll => 0x9f1cb4d2181f8b1c => 389
	i64 11482691884102096350, ; 520: fr/Microsoft.VisualStudio.Threading.resources.dll => 0x9f5ab76e412a95de => 383
	i64 11485890710487134646, ; 521: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 522: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 257
	i64 11513602507638267977, ; 523: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 217
	i64 11518296021396496455, ; 524: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 320
	i64 11529969570048099689, ; 525: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 291
	i64 11530571088791430846, ; 526: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 180
	i64 11580057168383206117, ; 527: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 230
	i64 11591352189662810718, ; 528: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 284
	i64 11597174155934063391, ; 529: fr\Microsoft.VisualStudio.Utilities.resources => 0xa0f170734aca5b1f => 397
	i64 11597940890313164233, ; 530: netstandard => 0xa0f429ca8d1805c9 => 166
	i64 11633085459938445148, ; 531: de/Microsoft.VisualStudio.Composition.resources.dll => 0xa17105975164875c => 368
	i64 11672361001936329215, ; 532: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 258
	i64 11692977985522001935, ; 533: System.Threading.Overlapped.dll => 0xa245cd869980680f => 139
	i64 11705530742807338875, ; 534: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 316
	i64 11707554492040141440, ; 535: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 536: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 143
	i64 11766809059788673038, ; 537: zh-Hans/Microsoft.VisualStudio.Threading.resources.dll => 0xa34c1a7f248d500e => 391
	i64 11883995243093580550, ; 538: Mockup => 0xa4ec6eb5a1065b06 => 0
	i64 11890655789319506262, ; 539: ko/StreamJsonRpc.resources.dll => 0xa5041870e4d4c956 => 426
	i64 11938677804301963148, ; 540: tr/Microsoft.ServiceHub.Framework.resources.dll => 0xa5aeb4358d424f8c => 351
	i64 11991047634523762324, ; 541: System.Net => 0xa668c24ad493ae94 => 81
	i64 12008693925152623904, ; 542: pl\Microsoft.VisualStudio.Utilities.resources => 0xa6a77380091d0d20 => 401
	i64 12011556116648931059, ; 543: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 219
	i64 12040886584167504988, ; 544: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 545: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 546: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 547: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 548: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12124151557889122664, ; 549: pt-BR\Microsoft.VisualStudio.Utilities.resources => 0xa841a39afafae168 => 402
	i64 12137774235383566651, ; 550: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 288
	i64 12145679461940342714, ; 551: System.Text.Json => 0xa88e1f1ebcb62fba => 221
	i64 12191646537372739477, ; 552: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 224
	i64 12201331334810686224, ; 553: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 554: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12313367145828839434, ; 555: System.IO.Pipelines => 0xaae1de2e1c17f00a => 217
	i64 12332222936682028543, ; 556: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12374012165002318533, ; 557: cs\Microsoft.VisualStudio.Composition.resources => 0xabb95280f55352c5 => 367
	i64 12375446203996702057, ; 558: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 559: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 256
	i64 12466513435562512481, ; 560: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 270
	i64 12471568088487385307, ; 561: fr\Microsoft.ServiceHub.Resources => 0xad13e9196a6358db => 357
	i64 12475113361194491050, ; 562: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 433
	i64 12481884125606176949, ; 563: zh-Hant/StreamJsonRpc.resources.dll => 0xad388f7afa57e8b5 => 432
	i64 12487638416075308985, ; 564: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 250
	i64 12517810545449516888, ; 565: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 566: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 238
	i64 12550732019250633519, ; 567: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12573751959656727467, ; 568: ru/Microsoft.VisualStudio.Validation.resources.dll => 0xae7ef0c9e93603ab => 416
	i64 12603216663576844694, ; 569: de/Microsoft.VisualStudio.Threading.resources.dll => 0xaee79ec7e3c81996 => 381
	i64 12681088699309157496, ; 570: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 321
	i64 12699999919562409296, ; 571: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 572: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 239
	i64 12708238894395270091, ; 573: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 574: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 575: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12726057104018228727, ; 576: Microsoft.NET.StringTools => 0xb09c0982b457c5f7 => 191
	i64 12753841065332862057, ; 577: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 293
	i64 12808034783427285688, ; 578: cs\StreamJsonRpc.resources => 0xb1bf47c69107d2b8 => 420
	i64 12823819093633476069, ; 579: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 334
	i64 12828192437253469131, ; 580: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 304
	i64 12835242264250840079, ; 581: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 582: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 184
	i64 12843770487262409629, ; 583: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12848781286208560954, ; 584: Microsoft.VisualStudio.Telemetry => 0xb2500a810925df3a => 197
	i64 12859557719246324186, ; 585: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12928116100519456705, ; 586: es\Microsoft.VisualStudio.Utilities.resources => 0xb369e518ea786fc1 => 396
	i64 12963446364377008305, ; 587: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 216
	i64 12982280885948128408, ; 588: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 249
	i64 13000926602004112928, ; 589: zh-Hans\Microsoft.VisualStudio.Composition.resources => 0xb46c91dcd761a620 => 378
	i64 13019838822340531700, ; 590: cs/Microsoft.VisualStudio.Composition.resources.dll => 0xb4afc26d467295f4 => 367
	i64 13068258254871114833, ; 591: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13072259076476491058, ; 592: tr\StreamJsonRpc.resources => 0xb569fe5ec941d532 => 430
	i64 13126023683090012938, ; 593: System.Composition.TypedParts.dll => 0xb62900febff1db0a => 212
	i64 13129914918964716986, ; 594: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 253
	i64 13130412034557475351, ; 595: fr\Microsoft.VisualStudio.Threading.resources => 0xb638982d724ffa17 => 383
	i64 13162471042547327635, ; 596: System.Security.Permissions => 0xb6aa7dace9662293 => 220
	i64 13173818576982874404, ; 597: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 598: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 308
	i64 13222659110913276082, ; 599: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 322
	i64 13244563641972016158, ; 600: pt-BR/Microsoft.ServiceHub.Framework.resources.dll => 0xb7ce2475accbc41e => 349
	i64 13343850469010654401, ; 601: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 169
	i64 13370592475155966277, ; 602: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 603: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 316
	i64 13401370062847626945, ; 604: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 288
	i64 13404347523447273790, ; 605: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 243
	i64 13431476299110033919, ; 606: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 607: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 299
	i64 13463706743370286408, ; 608: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 609: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 301
	i64 13467053111158216594, ; 610: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 336
	i64 13491513212026656886, ; 611: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 236
	i64 13502641473732064860, ; 612: System.Composition.AttributedModel => 0xbb6304e15b41b65c => 208
	i64 13540124433173649601, ; 613: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 337
	i64 13545416393490209236, ; 614: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 320
	i64 13572454107664307259, ; 615: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 278
	i64 13578472628727169633, ; 616: System.Xml.XPath => 0xbc706ce9fba5c261 => 159
	i64 13580399111273692417, ; 617: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 618: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 249
	i64 13647894001087880694, ; 619: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 620: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 229
	i64 13702626353344114072, ; 621: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13703125838636057883, ; 622: Microsoft.VisualStudio.Validation.dll => 0xbe2b48591461051b => 201
	i64 13710614125866346983, ; 623: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 624: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 625: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 626: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 315
	i64 13768883594457632599, ; 627: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 628: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 318
	i64 13819460841644211703, ; 629: es\Microsoft.ServiceHub.Resources => 0xbfc8966ab59fbdf7 => 356
	i64 13828521679616088467, ; 630: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 302
	i64 13859681129916375842, ; 631: tr\Microsoft.VisualStudio.Validation.resources => 0xc0577a8e50d9a322 => 417
	i64 13881769479078963060, ; 632: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 633: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 223
	i64 13911222732217019342, ; 634: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 635: System.Windows.dll => 0xc14bc67b8bba9714 => 153
	i64 13959074834287824816, ; 636: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 256
	i64 13988492781996941750, ; 637: ja\Microsoft.ServiceHub.Framework.resources => 0xc2211c122e0b21b6 => 346
	i64 14043772898905986081, ; 638: tr/Microsoft.VisualStudio.Utilities.resources.dll => 0xc2e5810b618c9421 => 404
	i64 14075334701871371868, ; 639: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 640: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 310
	i64 14124974489674258913, ; 641: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 238
	i64 14125464355221830302, ; 642: System.Threading.dll => 0xc407bafdbc707a9e => 147
	i64 14175074915974767561, ; 643: zh-Hans\Microsoft.ServiceHub.Resources => 0xc4b7fb888739e3c9 => 365
	i64 14178052285788134900, ; 644: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 225
	i64 14212104595480609394, ; 645: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 646: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 647: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 648: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 649: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 650: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 276
	i64 14298246716367104064, ; 651: System.Web.dll => 0xc66d93a217f4e840 => 152
	i64 14327695147300244862, ; 652: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 653: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14330684041385202088, ; 654: pt-BR/Microsoft.VisualStudio.Threading.resources.dll => 0xc6e0d1355b1fd1a8 => 388
	i64 14331727281556788554, ; 655: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 226
	i64 14346402571976470310, ; 656: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14370252628338276234, ; 657: tr/Microsoft.VisualStudio.Validation.resources.dll => 0xc76d64a0ecb9f78a => 417
	i64 14391267691003248864, ; 658: Nerdbank.Streams.dll => 0xc7b80db77dce00e0 => 203
	i64 14415297290983905433, ; 659: pt-BR\StreamJsonRpc.resources => 0xc80d6c82b8bf1899 => 428
	i64 14452298576064698508, ; 660: es\Microsoft.VisualStudio.Validation.resources => 0xc890e0fbbe38588c => 409
	i64 14461014870687870182, ; 661: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 662: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 331
	i64 14486659737292545672, ; 663: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 261
	i64 14495724990987328804, ; 664: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 279
	i64 14522721392235705434, ; 665: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 312
	i64 14551742072151931844, ; 666: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 667: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 668: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14614774114972620539, ; 669: zh-Hans/Microsoft.VisualStudio.Composition.resources.dll => 0xcad21ba00b8456fb => 378
	i64 14622043554576106986, ; 670: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14636892923918804708, ; 671: ja/StreamJsonRpc.resources.dll => 0xcb20b090919be6e4 => 425
	i64 14644440854989303794, ; 672: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 271
	i64 14656309759869513278, ; 673: Microsoft.VisualStudio.RemoteControl.dll => 0xcb65ac12fb1cee3e => 195
	i64 14669215534098758659, ; 674: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 178
	i64 14690985099581930927, ; 675: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 151
	i64 14705122255218365489, ; 676: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 323
	i64 14744092281598614090, ; 677: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 339
	i64 14753596820584604397, ; 678: zh-Hans/StreamJsonRpc.resources.dll => 0xccbf4e23f24722ed => 431
	i64 14771404191615744121, ; 679: pl\Microsoft.VisualStudio.Composition.resources => 0xccfe91d99af8f879 => 374
	i64 14792063746108907174, ; 680: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 299
	i64 14819209644871321045, ; 681: zh-Hans/Microsoft.VisualStudio.Utilities.resources.dll => 0xcda868a80e9905d5 => 405
	i64 14820817770416679739, ; 682: tr\Microsoft.VisualStudio.Threading.resources => 0xcdae1f3cf67bab3b => 390
	i64 14832630590065248058, ; 683: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14847150824983734404, ; 684: Microsoft.VisualStudio.RpcContracts => 0xce0bad0301cda884 => 196
	i64 14852515768018889994, ; 685: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 247
	i64 14889905118082851278, ; 686: GoogleGson.dll => 0xcea391d0969961ce => 173
	i64 14892012299694389861, ; 687: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 340
	i64 14904040806490515477, ; 688: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 307
	i64 14912225920358050525, ; 689: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 690: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 691: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 179
	i64 14984936317414011727, ; 692: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 693: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 694: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 250
	i64 15015154896917945444, ; 695: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15023260263817286165, ; 696: es/StreamJsonRpc.resources.dll => 0xd07d579d01121215 => 422
	i64 15023528575408771796, ; 697: ko\StreamJsonRpc.resources => 0xd07e4ba42a2b92d4 => 426
	i64 15024878362326791334, ; 698: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15044901218619597537, ; 699: en\Microsoft.VisualStudio.Utilities.resources => 0xd0ca39f270a9a2e1 => 395
	i64 15071021337266399595, ; 700: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 701: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15078030747917693565, ; 702: pl/Microsoft.VisualStudio.Threading.resources.dll => 0xd13fed14120d327d => 387
	i64 15111608613780139878, ; 703: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 324
	i64 15115185479366240210, ; 704: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 705: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 706: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 277
	i64 15201252454341482878, ; 707: ja\StreamJsonRpc.resources => 0xd2f5b2914a0f197e => 425
	i64 15227001540531775957, ; 708: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 177
	i64 15234786388537674379, ; 709: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15237913642941303365, ; 710: pl\Microsoft.ServiceHub.Framework.resources => 0xd377f1b96d984a45 => 348
	i64 15249474349747396247, ; 711: zh-Hans\StreamJsonRpc.resources => 0xd3a104203c1fde97 => 431
	i64 15250465174479574862, ; 712: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 713: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 240
	i64 15279429628684179188, ; 714: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 305
	i64 15299439993936780255, ; 715: System.Xml.XPath.dll => 0xd452879d55019bdf => 159
	i64 15300862763834473199, ; 716: System.Composition.Hosting.dll => 0xd457959dc35afaef => 210
	i64 15338463749992804988, ; 717: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15352427450275134006, ; 718: System.Composition.Runtime.dll => 0xd50ec76ce59afa36 => 211
	i64 15370334346939861994, ; 719: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 245
	i64 15391712275433856905, ; 720: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 179
	i64 15455258289457179632, ; 721: pl/Microsoft.ServiceHub.Resources.dll => 0xd67c1b875f01abf0 => 361
	i64 15475196252089753159, ; 722: System.Diagnostics.EventLog => 0xd6c2f1000b441e47 => 214
	i64 15485751695148966188, ; 723: pt-BR/Microsoft.ServiceHub.Resources.dll => 0xd6e8711ea541e12c => 362
	i64 15526743539506359484, ; 724: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 725: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 726: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 727: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 311
	i64 15541854775306130054, ; 728: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 729: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15558627161509849899, ; 730: ru\Microsoft.VisualStudio.Validation.resources => 0xd7eb58f86289eb2b => 416
	i64 15582737692548360875, ; 731: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 269
	i64 15609085926864131306, ; 732: System.dll => 0xd89e9cf3334914ea => 163
	i64 15661133872274321916, ; 733: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 155
	i64 15664356999916475676, ; 734: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 311
	i64 15686827046011320720, ; 735: it\Microsoft.VisualStudio.Utilities.resources => 0xd9b2ce16027eb990 => 398
	i64 15710114879900314733, ; 736: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 737: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 319
	i64 15750798694401567573, ; 738: ru\Microsoft.VisualStudio.Threading.resources => 0xda9613f6147deb55 => 389
	i64 15755368083429170162, ; 739: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 740: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 283
	i64 15783653065526199428, ; 741: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 312
	i64 15817206913877585035, ; 742: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 143
	i64 15847085070278954535, ; 743: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 138
	i64 15885744048853936810, ; 744: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15903718333706527842, ; 745: zh-Hans/Microsoft.VisualStudio.Validation.resources.dll => 0xdcb55b902071e462 => 418
	i64 15928521404965645318, ; 746: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 185
	i64 15934062614519587357, ; 747: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 748: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15953812885175980916, ; 749: ko\Microsoft.VisualStudio.Validation.resources => 0xdd67544ac9f6d374 => 413
	i64 15963349826457351533, ; 750: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 141
	i64 15971679995444160383, ; 751: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 752: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16054465462676478687, ; 753: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16090829755721178160, ; 754: tr\Microsoft.ServiceHub.Framework.resources => 0xdf4e1c68f30bdc30 => 351
	i64 16091261637069827414, ; 755: ko/Microsoft.VisualStudio.Validation.resources.dll => 0xdf4fa534296aed56 => 413
	i64 16131251062481977478, ; 756: pl\Microsoft.ServiceHub.Resources => 0xdfddb75fd1e18086 => 361
	i64 16154507427712707110, ; 757: System => 0xe03056ea4e39aa26 => 163
	i64 16177821557421402585, ; 758: StreamJsonRpc => 0xe0832afe21c269d9 => 205
	i64 16201041905702586336, ; 759: System.Diagnostics.PerformanceCounter => 0xe0d5a9c6c49ec7e0 => 215
	i64 16219561732052121626, ; 760: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16236971995090710244, ; 761: pt-BR\Microsoft.VisualStudio.Composition.resources => 0xe15550009b58eee4 => 375
	i64 16288847719894691167, ; 762: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 325
	i64 16315482530584035869, ; 763: WindowsBase.dll => 0xe26c3ceb1e8d821d => 164
	i64 16321164108206115771, ; 764: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 181
	i64 16337011941688632206, ; 765: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 766: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 255
	i64 16423015068819898779, ; 767: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 304
	i64 16454459195343277943, ; 768: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 769: Mono.Android.Export.dll => 0xe4f04b741db987ce => 168
	i64 16520416485536215268, ; 770: es\Microsoft.VisualStudio.Threading.resources => 0xe5444f43c1e4b0e4 => 382
	i64 16565028646146589191, ; 771: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 207
	i64 16582434033142728747, ; 772: Microsoft.NET.StringTools.dll => 0xe620a3e548d2082b => 191
	i64 16583419235299384312, ; 773: ko\Microsoft.VisualStudio.Threading.resources => 0xe62423ee89665bf8 => 386
	i64 16584736615512946867, ; 774: Microsoft.VisualStudio.Utilities.dll => 0xe628d215051038b3 => 199
	i64 16589693266713801121, ; 775: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 268
	i64 16621146507174665210, ; 776: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 242
	i64 16643194905613199096, ; 777: System.Composition.Runtime => 0xe6f8819654aa66f8 => 211
	i64 16648892297579399389, ; 778: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 172
	i64 16649148416072044166, ; 779: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 190
	i64 16677317093839702854, ; 780: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 275
	i64 16702652415771857902, ; 781: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 150
	i64 16709499819875633724, ; 782: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 783: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 784: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 785: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 786: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16800021547249663972, ; 787: Microsoft.ServiceHub.Framework => 0xe925aa963eb97fe4 => 192
	i64 16822611501064131242, ; 788: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16827289987956835956, ; 789: cs\Microsoft.VisualStudio.Utilities.resources => 0xe9868b16d8a78674 => 393
	i64 16833383113903931215, ; 790: mscorlib => 0xe99c30c1484d7f4f => 165
	i64 16856067890322379635, ; 791: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16870847574843270873, ; 792: de/Microsoft.ServiceHub.Resources.dll => 0xea214a7bd64b26d9 => 355
	i64 16890310621557459193, ; 793: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 137
	i64 16933958494752847024, ; 794: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 795: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 332
	i64 16977952268158210142, ; 796: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 797: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 268
	i64 16998075588627545693, ; 798: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 273
	i64 17008137082415910100, ; 799: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17018932226584424969, ; 800: pt-BR\Microsoft.VisualStudio.Threading.resources => 0xec2f64b09e033209 => 388
	i64 17024911836938395553, ; 801: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 231
	i64 17031351772568316411, ; 802: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 272
	i64 17037200463775726619, ; 803: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 259
	i64 17062143951396181894, ; 804: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 805: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 339
	i64 17118171214553292978, ; 806: System.Threading.Channels => 0xed8ff6060fc420b2 => 138
	i64 17160917431135180830, ; 807: ru\Microsoft.VisualStudio.Utilities.resources => 0xee27d37b2e9f181e => 403
	i64 17180572832852637353, ; 808: es\StreamJsonRpc.resources => 0xee6da7f703e876a9 => 422
	i64 17187273293601214786, ; 809: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 810: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 811: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17230721278011714856, ; 812: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 813: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 148
	i64 17260702271250283638, ; 814: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 815: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 816: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 817: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 317
	i64 17346290192329067203, ; 818: zh-Hant\Microsoft.VisualStudio.Threading.resources => 0xf0ba67067c9dcac3 => 392
	i64 17360349973592121190, ; 819: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 297
	i64 17438153253682247751, ; 820: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 332
	i64 17470386307322966175, ; 821: System.Threading.Timer => 0xf27347c8d0d5709f => 146
	i64 17490334362188023649, ; 822: pl\Microsoft.VisualStudio.Validation.resources => 0xf2ba266f45068761 => 414
	i64 17509662556995089465, ; 823: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 824: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 315
	i64 17522591619082469157, ; 825: GoogleGson => 0xf32cc03d27a5bf25 => 173
	i64 17523946658117960076, ; 826: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 219
	i64 17590473451926037903, ; 827: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 224
	i64 17623389608345532001, ; 828: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 327
	i64 17627500474728259406, ; 829: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 830: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 831: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 338
	i64 17704177640604968747, ; 832: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 270
	i64 17710060891934109755, ; 833: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 267
	i64 17712670374920797664, ; 834: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17743407583038752114, ; 835: System.CodeDom.dll => 0xf63d3f302bff4572 => 206
	i64 17777860260071588075, ; 836: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17801122059615118823, ; 837: Microsoft.VisualStudio.Threading.dll => 0xf70a4a32e6baa5e7 => 198
	i64 17806780683907942013, ; 838: ja\Microsoft.VisualStudio.Composition.resources => 0xf71e64b0099ec67d => 372
	i64 17830918774018250459, ; 839: ja/Microsoft.ServiceHub.Resources.dll => 0xf7742627183396db => 359
	i64 17838668724098252521, ; 840: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17849620690824033494, ; 841: cs\Microsoft.ServiceHub.Framework.resources => 0xf7b697726c0774d6 => 341
	i64 17852204549962223340, ; 842: ko/Microsoft.ServiceHub.Resources.dll => 0xf7bfc574021c4eec => 360
	i64 17859375626191382484, ; 843: fr/Microsoft.VisualStudio.Utilities.resources.dll => 0xf7d93f824d6827d4 => 397
	i64 17872609556538910715, ; 844: ru/Microsoft.ServiceHub.Framework.resources.dll => 0xf80843b2d2c0e7fb => 350
	i64 17891337867145587222, ; 845: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 300
	i64 17894845729534052403, ; 846: tr/Microsoft.VisualStudio.Composition.resources.dll => 0xf85743614b4b0833 => 377
	i64 17928294245072900555, ; 847: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17967933707255284319, ; 848: it/Microsoft.ServiceHub.Framework.resources.dll => 0xf95aec8230b8025f => 345
	i64 17992315986609351877, ; 849: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 160
	i64 18025913125965088385, ; 850: System.Threading => 0xfa28e87b91334681 => 147
	i64 18099568558057551825, ; 851: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 326
	i64 18116111925905154859, ; 852: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 236
	i64 18121036031235206392, ; 853: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 272
	i64 18123834358115542242, ; 854: fr/StreamJsonRpc.resources.dll => 0xfb84cb53137f24e2 => 423
	i64 18146411883821974900, ; 855: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 856: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18166800034629147097, ; 857: ru\StreamJsonRpc.resources => 0xfc1d7061319fd9d9 => 429
	i64 18171003490741864161, ; 858: MessagePack => 0xfc2c5f66960d46e1 => 174
	i64 18225059387460068507, ; 859: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 145
	i64 18236439618683771511, ; 860: System.Threading.AccessControl.dll => 0xfd14d9365f819a77 => 222
	i64 18245806341561545090, ; 861: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 862: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 253
	i64 18305135509493619199, ; 863: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 274
	i64 18318849532986632368, ; 864: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 865: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 321
	i64 18380184030268848184, ; 866: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 290
	i64 18439108438687598470 ; 867: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [868 x i32] [
	i32 390, ; 0
	i32 252, ; 1
	i32 195, ; 2
	i32 184, ; 3
	i32 170, ; 4
	i32 189, ; 5
	i32 399, ; 6
	i32 58, ; 7
	i32 363, ; 8
	i32 239, ; 9
	i32 150, ; 10
	i32 280, ; 11
	i32 379, ; 12
	i32 283, ; 13
	i32 399, ; 14
	i32 246, ; 15
	i32 132, ; 16
	i32 412, ; 17
	i32 199, ; 18
	i32 56, ; 19
	i32 282, ; 20
	i32 205, ; 21
	i32 343, ; 22
	i32 218, ; 23
	i32 314, ; 24
	i32 95, ; 25
	i32 405, ; 26
	i32 265, ; 27
	i32 129, ; 28
	i32 386, ; 29
	i32 357, ; 30
	i32 216, ; 31
	i32 144, ; 32
	i32 371, ; 33
	i32 350, ; 34
	i32 240, ; 35
	i32 18, ; 36
	i32 418, ; 37
	i32 317, ; 38
	i32 251, ; 39
	i32 266, ; 40
	i32 149, ; 41
	i32 104, ; 42
	i32 95, ; 43
	i32 295, ; 44
	i32 325, ; 45
	i32 419, ; 46
	i32 391, ; 47
	i32 36, ; 48
	i32 28, ; 49
	i32 235, ; 50
	i32 273, ; 51
	i32 50, ; 52
	i32 115, ; 53
	i32 70, ; 54
	i32 186, ; 55
	i32 65, ; 56
	i32 169, ; 57
	i32 352, ; 58
	i32 144, ; 59
	i32 323, ; 60
	i32 294, ; 61
	i32 234, ; 62
	i32 269, ; 63
	i32 259, ; 64
	i32 40, ; 65
	i32 89, ; 66
	i32 384, ; 67
	i32 81, ; 68
	i32 204, ; 69
	i32 66, ; 70
	i32 62, ; 71
	i32 86, ; 72
	i32 233, ; 73
	i32 106, ; 74
	i32 313, ; 75
	i32 280, ; 76
	i32 102, ; 77
	i32 35, ; 78
	i32 230, ; 79
	i32 335, ; 80
	i32 282, ; 81
	i32 404, ; 82
	i32 187, ; 83
	i32 172, ; 84
	i32 335, ; 85
	i32 119, ; 86
	i32 267, ; 87
	i32 309, ; 88
	i32 327, ; 89
	i32 141, ; 90
	i32 140, ; 91
	i32 303, ; 92
	i32 53, ; 93
	i32 35, ; 94
	i32 140, ; 95
	i32 356, ; 96
	i32 204, ; 97
	i32 407, ; 98
	i32 227, ; 99
	i32 237, ; 100
	i32 182, ; 101
	i32 251, ; 102
	i32 415, ; 103
	i32 8, ; 104
	i32 14, ; 105
	i32 331, ; 106
	i32 279, ; 107
	i32 51, ; 108
	i32 262, ; 109
	i32 373, ; 110
	i32 136, ; 111
	i32 101, ; 112
	i32 396, ; 113
	i32 400, ; 114
	i32 244, ; 115
	i32 289, ; 116
	i32 116, ; 117
	i32 228, ; 118
	i32 162, ; 119
	i32 334, ; 120
	i32 165, ; 121
	i32 67, ; 122
	i32 178, ; 123
	i32 309, ; 124
	i32 209, ; 125
	i32 80, ; 126
	i32 101, ; 127
	i32 284, ; 128
	i32 355, ; 129
	i32 117, ; 130
	i32 212, ; 131
	i32 213, ; 132
	i32 408, ; 133
	i32 314, ; 134
	i32 296, ; 135
	i32 392, ; 136
	i32 421, ; 137
	i32 78, ; 138
	i32 295, ; 139
	i32 114, ; 140
	i32 121, ; 141
	i32 48, ; 142
	i32 393, ; 143
	i32 202, ; 144
	i32 128, ; 145
	i32 260, ; 146
	i32 231, ; 147
	i32 82, ; 148
	i32 110, ; 149
	i32 75, ; 150
	i32 345, ; 151
	i32 306, ; 152
	i32 364, ; 153
	i32 387, ; 154
	i32 189, ; 155
	i32 53, ; 156
	i32 286, ; 157
	i32 176, ; 158
	i32 69, ; 159
	i32 285, ; 160
	i32 83, ; 161
	i32 349, ; 162
	i32 171, ; 163
	i32 329, ; 164
	i32 116, ; 165
	i32 177, ; 166
	i32 155, ; 167
	i32 176, ; 168
	i32 225, ; 169
	i32 410, ; 170
	i32 166, ; 171
	i32 278, ; 172
	i32 347, ; 173
	i32 252, ; 174
	i32 358, ; 175
	i32 215, ; 176
	i32 341, ; 177
	i32 180, ; 178
	i32 32, ; 179
	i32 174, ; 180
	i32 187, ; 181
	i32 400, ; 182
	i32 122, ; 183
	i32 72, ; 184
	i32 62, ; 185
	i32 210, ; 186
	i32 160, ; 187
	i32 113, ; 188
	i32 175, ; 189
	i32 88, ; 190
	i32 185, ; 191
	i32 340, ; 192
	i32 105, ; 193
	i32 18, ; 194
	i32 145, ; 195
	i32 118, ; 196
	i32 58, ; 197
	i32 246, ; 198
	i32 17, ; 199
	i32 194, ; 200
	i32 52, ; 201
	i32 364, ; 202
	i32 92, ; 203
	i32 214, ; 204
	i32 337, ; 205
	i32 55, ; 206
	i32 129, ; 207
	i32 193, ; 208
	i32 151, ; 209
	i32 41, ; 210
	i32 92, ; 211
	i32 369, ; 212
	i32 290, ; 213
	i32 410, ; 214
	i32 50, ; 215
	i32 307, ; 216
	i32 374, ; 217
	i32 161, ; 218
	i32 432, ; 219
	i32 13, ; 220
	i32 264, ; 221
	i32 228, ; 222
	i32 285, ; 223
	i32 36, ; 224
	i32 67, ; 225
	i32 109, ; 226
	i32 414, ; 227
	i32 384, ; 228
	i32 366, ; 229
	i32 343, ; 230
	i32 229, ; 231
	i32 380, ; 232
	i32 99, ; 233
	i32 99, ; 234
	i32 11, ; 235
	i32 11, ; 236
	i32 271, ; 237
	i32 25, ; 238
	i32 128, ; 239
	i32 76, ; 240
	i32 263, ; 241
	i32 365, ; 242
	i32 109, ; 243
	i32 342, ; 244
	i32 354, ; 245
	i32 289, ; 246
	i32 287, ; 247
	i32 106, ; 248
	i32 407, ; 249
	i32 403, ; 250
	i32 2, ; 251
	i32 26, ; 252
	i32 242, ; 253
	i32 156, ; 254
	i32 333, ; 255
	i32 223, ; 256
	i32 198, ; 257
	i32 21, ; 258
	i32 336, ; 259
	i32 49, ; 260
	i32 43, ; 261
	i32 126, ; 262
	i32 232, ; 263
	i32 59, ; 264
	i32 409, ; 265
	i32 119, ; 266
	i32 201, ; 267
	i32 428, ; 268
	i32 292, ; 269
	i32 255, ; 270
	i32 241, ; 271
	i32 3, ; 272
	i32 421, ; 273
	i32 261, ; 274
	i32 427, ; 275
	i32 281, ; 276
	i32 38, ; 277
	i32 124, ; 278
	i32 330, ; 279
	i32 281, ; 280
	i32 330, ; 281
	i32 221, ; 282
	i32 148, ; 283
	i32 85, ; 284
	i32 90, ; 285
	i32 423, ; 286
	i32 265, ; 287
	i32 193, ; 288
	i32 433, ; 289
	i32 262, ; 290
	i32 420, ; 291
	i32 196, ; 292
	i32 318, ; 293
	i32 237, ; 294
	i32 248, ; 295
	i32 293, ; 296
	i32 183, ; 297
	i32 298, ; 298
	i32 263, ; 299
	i32 133, ; 300
	i32 371, ; 301
	i32 380, ; 302
	i32 96, ; 303
	i32 430, ; 304
	i32 3, ; 305
	i32 326, ; 306
	i32 402, ; 307
	i32 192, ; 308
	i32 105, ; 309
	i32 329, ; 310
	i32 33, ; 311
	i32 394, ; 312
	i32 153, ; 313
	i32 157, ; 314
	i32 154, ; 315
	i32 82, ; 316
	i32 218, ; 317
	i32 257, ; 318
	i32 363, ; 319
	i32 142, ; 320
	i32 87, ; 321
	i32 19, ; 322
	i32 258, ; 323
	i32 51, ; 324
	i32 377, ; 325
	i32 208, ; 326
	i32 227, ; 327
	i32 333, ; 328
	i32 61, ; 329
	i32 362, ; 330
	i32 54, ; 331
	i32 4, ; 332
	i32 97, ; 333
	i32 226, ; 334
	i32 376, ; 335
	i32 17, ; 336
	i32 154, ; 337
	i32 84, ; 338
	i32 415, ; 339
	i32 29, ; 340
	i32 346, ; 341
	i32 45, ; 342
	i32 370, ; 343
	i32 64, ; 344
	i32 411, ; 345
	i32 368, ; 346
	i32 66, ; 347
	i32 324, ; 348
	i32 171, ; 349
	i32 266, ; 350
	i32 1, ; 351
	i32 301, ; 352
	i32 47, ; 353
	i32 24, ; 354
	i32 234, ; 355
	i32 370, ; 356
	i32 385, ; 357
	i32 366, ; 358
	i32 164, ; 359
	i32 108, ; 360
	i32 429, ; 361
	i32 207, ; 362
	i32 12, ; 363
	i32 260, ; 364
	i32 63, ; 365
	i32 27, ; 366
	i32 23, ; 367
	i32 93, ; 368
	i32 167, ; 369
	i32 12, ; 370
	i32 305, ; 371
	i32 427, ; 372
	i32 381, ; 373
	i32 190, ; 374
	i32 29, ; 375
	i32 103, ; 376
	i32 222, ; 377
	i32 14, ; 378
	i32 126, ; 379
	i32 243, ; 380
	i32 275, ; 381
	i32 375, ; 382
	i32 91, ; 383
	i32 264, ; 384
	i32 200, ; 385
	i32 220, ; 386
	i32 9, ; 387
	i32 347, ; 388
	i32 86, ; 389
	i32 398, ; 390
	i32 406, ; 391
	i32 385, ; 392
	i32 254, ; 393
	i32 287, ; 394
	i32 395, ; 395
	i32 328, ; 396
	i32 71, ; 397
	i32 167, ; 398
	i32 1, ; 399
	i32 274, ; 400
	i32 5, ; 401
	i32 328, ; 402
	i32 44, ; 403
	i32 27, ; 404
	i32 344, ; 405
	i32 411, ; 406
	i32 348, ; 407
	i32 302, ; 408
	i32 382, ; 409
	i32 157, ; 410
	i32 0, ; 411
	i32 277, ; 412
	i32 112, ; 413
	i32 342, ; 414
	i32 338, ; 415
	i32 121, ; 416
	i32 424, ; 417
	i32 292, ; 418
	i32 233, ; 419
	i32 344, ; 420
	i32 158, ; 421
	i32 131, ; 422
	i32 297, ; 423
	i32 57, ; 424
	i32 408, ; 425
	i32 137, ; 426
	i32 83, ; 427
	i32 30, ; 428
	i32 244, ; 429
	i32 424, ; 430
	i32 10, ; 431
	i32 203, ; 432
	i32 294, ; 433
	i32 170, ; 434
	i32 353, ; 435
	i32 241, ; 436
	i32 353, ; 437
	i32 149, ; 438
	i32 94, ; 439
	i32 412, ; 440
	i32 254, ; 441
	i32 60, ; 442
	i32 188, ; 443
	i32 206, ; 444
	i32 352, ; 445
	i32 156, ; 446
	i32 197, ; 447
	i32 313, ; 448
	i32 182, ; 449
	i32 64, ; 450
	i32 88, ; 451
	i32 79, ; 452
	i32 47, ; 453
	i32 186, ; 454
	i32 142, ; 455
	i32 310, ; 456
	i32 200, ; 457
	i32 373, ; 458
	i32 303, ; 459
	i32 248, ; 460
	i32 74, ; 461
	i32 91, ; 462
	i32 300, ; 463
	i32 135, ; 464
	i32 90, ; 465
	i32 286, ; 466
	i32 306, ; 467
	i32 379, ; 468
	i32 245, ; 469
	i32 394, ; 470
	i32 209, ; 471
	i32 372, ; 472
	i32 308, ; 473
	i32 112, ; 474
	i32 42, ; 475
	i32 158, ; 476
	i32 4, ; 477
	i32 103, ; 478
	i32 70, ; 479
	i32 60, ; 480
	i32 39, ; 481
	i32 401, ; 482
	i32 194, ; 483
	i32 235, ; 484
	i32 152, ; 485
	i32 56, ; 486
	i32 34, ; 487
	i32 406, ; 488
	i32 181, ; 489
	i32 188, ; 490
	i32 232, ; 491
	i32 21, ; 492
	i32 162, ; 493
	i32 202, ; 494
	i32 298, ; 495
	i32 175, ; 496
	i32 360, ; 497
	i32 319, ; 498
	i32 359, ; 499
	i32 369, ; 500
	i32 296, ; 501
	i32 376, ; 502
	i32 291, ; 503
	i32 139, ; 504
	i32 322, ; 505
	i32 183, ; 506
	i32 89, ; 507
	i32 146, ; 508
	i32 247, ; 509
	i32 213, ; 510
	i32 161, ; 511
	i32 419, ; 512
	i32 276, ; 513
	i32 358, ; 514
	i32 354, ; 515
	i32 6, ; 516
	i32 168, ; 517
	i32 31, ; 518
	i32 389, ; 519
	i32 383, ; 520
	i32 107, ; 521
	i32 257, ; 522
	i32 217, ; 523
	i32 320, ; 524
	i32 291, ; 525
	i32 180, ; 526
	i32 230, ; 527
	i32 284, ; 528
	i32 397, ; 529
	i32 166, ; 530
	i32 368, ; 531
	i32 258, ; 532
	i32 139, ; 533
	i32 316, ; 534
	i32 59, ; 535
	i32 143, ; 536
	i32 391, ; 537
	i32 0, ; 538
	i32 426, ; 539
	i32 351, ; 540
	i32 81, ; 541
	i32 401, ; 542
	i32 219, ; 543
	i32 74, ; 544
	i32 130, ; 545
	i32 25, ; 546
	i32 7, ; 547
	i32 93, ; 548
	i32 402, ; 549
	i32 288, ; 550
	i32 221, ; 551
	i32 224, ; 552
	i32 113, ; 553
	i32 9, ; 554
	i32 217, ; 555
	i32 104, ; 556
	i32 367, ; 557
	i32 19, ; 558
	i32 256, ; 559
	i32 270, ; 560
	i32 357, ; 561
	i32 433, ; 562
	i32 432, ; 563
	i32 250, ; 564
	i32 33, ; 565
	i32 238, ; 566
	i32 46, ; 567
	i32 416, ; 568
	i32 381, ; 569
	i32 321, ; 570
	i32 30, ; 571
	i32 239, ; 572
	i32 57, ; 573
	i32 134, ; 574
	i32 114, ; 575
	i32 191, ; 576
	i32 293, ; 577
	i32 420, ; 578
	i32 334, ; 579
	i32 304, ; 580
	i32 55, ; 581
	i32 184, ; 582
	i32 6, ; 583
	i32 197, ; 584
	i32 77, ; 585
	i32 396, ; 586
	i32 216, ; 587
	i32 249, ; 588
	i32 378, ; 589
	i32 367, ; 590
	i32 111, ; 591
	i32 430, ; 592
	i32 212, ; 593
	i32 253, ; 594
	i32 383, ; 595
	i32 220, ; 596
	i32 102, ; 597
	i32 308, ; 598
	i32 322, ; 599
	i32 349, ; 600
	i32 169, ; 601
	i32 115, ; 602
	i32 316, ; 603
	i32 288, ; 604
	i32 243, ; 605
	i32 76, ; 606
	i32 299, ; 607
	i32 85, ; 608
	i32 301, ; 609
	i32 336, ; 610
	i32 236, ; 611
	i32 208, ; 612
	i32 337, ; 613
	i32 320, ; 614
	i32 278, ; 615
	i32 159, ; 616
	i32 2, ; 617
	i32 249, ; 618
	i32 24, ; 619
	i32 229, ; 620
	i32 32, ; 621
	i32 201, ; 622
	i32 117, ; 623
	i32 37, ; 624
	i32 16, ; 625
	i32 315, ; 626
	i32 52, ; 627
	i32 318, ; 628
	i32 356, ; 629
	i32 302, ; 630
	i32 417, ; 631
	i32 20, ; 632
	i32 223, ; 633
	i32 123, ; 634
	i32 153, ; 635
	i32 256, ; 636
	i32 346, ; 637
	i32 404, ; 638
	i32 131, ; 639
	i32 310, ; 640
	i32 238, ; 641
	i32 147, ; 642
	i32 365, ; 643
	i32 225, ; 644
	i32 120, ; 645
	i32 28, ; 646
	i32 132, ; 647
	i32 100, ; 648
	i32 134, ; 649
	i32 276, ; 650
	i32 152, ; 651
	i32 97, ; 652
	i32 125, ; 653
	i32 388, ; 654
	i32 226, ; 655
	i32 69, ; 656
	i32 417, ; 657
	i32 203, ; 658
	i32 428, ; 659
	i32 409, ; 660
	i32 72, ; 661
	i32 331, ; 662
	i32 261, ; 663
	i32 279, ; 664
	i32 312, ; 665
	i32 136, ; 666
	i32 124, ; 667
	i32 71, ; 668
	i32 378, ; 669
	i32 111, ; 670
	i32 425, ; 671
	i32 271, ; 672
	i32 195, ; 673
	i32 178, ; 674
	i32 151, ; 675
	i32 323, ; 676
	i32 339, ; 677
	i32 431, ; 678
	i32 374, ; 679
	i32 299, ; 680
	i32 405, ; 681
	i32 390, ; 682
	i32 118, ; 683
	i32 196, ; 684
	i32 247, ; 685
	i32 173, ; 686
	i32 340, ; 687
	i32 307, ; 688
	i32 127, ; 689
	i32 133, ; 690
	i32 179, ; 691
	i32 77, ; 692
	i32 46, ; 693
	i32 250, ; 694
	i32 73, ; 695
	i32 422, ; 696
	i32 426, ; 697
	i32 63, ; 698
	i32 395, ; 699
	i32 98, ; 700
	i32 84, ; 701
	i32 387, ; 702
	i32 324, ; 703
	i32 43, ; 704
	i32 61, ; 705
	i32 277, ; 706
	i32 425, ; 707
	i32 177, ; 708
	i32 37, ; 709
	i32 348, ; 710
	i32 431, ; 711
	i32 40, ; 712
	i32 240, ; 713
	i32 305, ; 714
	i32 159, ; 715
	i32 210, ; 716
	i32 98, ; 717
	i32 211, ; 718
	i32 245, ; 719
	i32 179, ; 720
	i32 361, ; 721
	i32 214, ; 722
	i32 362, ; 723
	i32 135, ; 724
	i32 20, ; 725
	i32 65, ; 726
	i32 311, ; 727
	i32 125, ; 728
	i32 75, ; 729
	i32 416, ; 730
	i32 269, ; 731
	i32 163, ; 732
	i32 155, ; 733
	i32 311, ; 734
	i32 398, ; 735
	i32 5, ; 736
	i32 319, ; 737
	i32 389, ; 738
	i32 49, ; 739
	i32 283, ; 740
	i32 312, ; 741
	i32 143, ; 742
	i32 138, ; 743
	i32 100, ; 744
	i32 418, ; 745
	i32 185, ; 746
	i32 123, ; 747
	i32 120, ; 748
	i32 413, ; 749
	i32 141, ; 750
	i32 39, ; 751
	i32 68, ; 752
	i32 41, ; 753
	i32 351, ; 754
	i32 413, ; 755
	i32 361, ; 756
	i32 163, ; 757
	i32 205, ; 758
	i32 215, ; 759
	i32 73, ; 760
	i32 375, ; 761
	i32 325, ; 762
	i32 164, ; 763
	i32 181, ; 764
	i32 127, ; 765
	i32 255, ; 766
	i32 304, ; 767
	i32 68, ; 768
	i32 168, ; 769
	i32 382, ; 770
	i32 207, ; 771
	i32 191, ; 772
	i32 386, ; 773
	i32 199, ; 774
	i32 268, ; 775
	i32 242, ; 776
	i32 211, ; 777
	i32 172, ; 778
	i32 190, ; 779
	i32 275, ; 780
	i32 150, ; 781
	i32 45, ; 782
	i32 108, ; 783
	i32 48, ; 784
	i32 96, ; 785
	i32 31, ; 786
	i32 192, ; 787
	i32 23, ; 788
	i32 393, ; 789
	i32 165, ; 790
	i32 22, ; 791
	i32 355, ; 792
	i32 137, ; 793
	i32 78, ; 794
	i32 332, ; 795
	i32 54, ; 796
	i32 268, ; 797
	i32 273, ; 798
	i32 10, ; 799
	i32 388, ; 800
	i32 231, ; 801
	i32 272, ; 802
	i32 259, ; 803
	i32 16, ; 804
	i32 339, ; 805
	i32 138, ; 806
	i32 403, ; 807
	i32 422, ; 808
	i32 13, ; 809
	i32 15, ; 810
	i32 122, ; 811
	i32 87, ; 812
	i32 148, ; 813
	i32 22, ; 814
	i32 34, ; 815
	i32 79, ; 816
	i32 317, ; 817
	i32 392, ; 818
	i32 297, ; 819
	i32 332, ; 820
	i32 146, ; 821
	i32 414, ; 822
	i32 80, ; 823
	i32 315, ; 824
	i32 173, ; 825
	i32 219, ; 826
	i32 224, ; 827
	i32 327, ; 828
	i32 42, ; 829
	i32 26, ; 830
	i32 338, ; 831
	i32 270, ; 832
	i32 267, ; 833
	i32 107, ; 834
	i32 206, ; 835
	i32 110, ; 836
	i32 198, ; 837
	i32 372, ; 838
	i32 359, ; 839
	i32 7, ; 840
	i32 341, ; 841
	i32 360, ; 842
	i32 397, ; 843
	i32 350, ; 844
	i32 300, ; 845
	i32 377, ; 846
	i32 44, ; 847
	i32 345, ; 848
	i32 160, ; 849
	i32 147, ; 850
	i32 326, ; 851
	i32 236, ; 852
	i32 272, ; 853
	i32 423, ; 854
	i32 38, ; 855
	i32 15, ; 856
	i32 429, ; 857
	i32 174, ; 858
	i32 145, ; 859
	i32 222, ; 860
	i32 8, ; 861
	i32 253, ; 862
	i32 274, ; 863
	i32 130, ; 864
	i32 321, ; 865
	i32 290, ; 866
	i32 94 ; 867
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
