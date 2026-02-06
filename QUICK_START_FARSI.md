# 🚀 راهنمای سریع اجرای RAWdesk

## ❌ مشکل: دکمه "Run workflow" نمایش داده نمی‌شود

### علت
GitHub فقط دکمه "Run workflow" را برای workflow هایی نمایش می‌دهد که در branch اصلی (master) باشند.

**وضعیت فعلی:**
- ✅ Workflow ها آماده هستند
- ✅ تنظیمات صحیح است
- ❌ در branch `copilot/setup-rawdesk-client` هستند (نه master)

---

## ✅ راه حل (3 گام ساده)

### گام 1: Merge کردن PR

1. به این لینک بروید:
   ```
   https://github.com/akmfad1/rustdesk/pull/2
   ```

2. دکمه سبز **"Merge pull request"** را کلیک کنید

3. **"Confirm merge"** را بزنید

### گام 2: رفتن به صفحه Actions

بعد از merge، به این لینک بروید:
```
https://github.com/akmfad1/rustdesk/actions
```

### گام 3: اجرای Workflow

1. روی **"Build RAWdesk (Windows 32-bit)"** کلیک کنید
2. حالا دکمه **"Run workflow"** را خواهید دید! 🎉
3. آن را کلیک کنید
4. دکمه سبز **"Run workflow"** در پنجره باز شده را بزنید
5. منتظر 15-20 دقیقه بمانید

---

## 📥 دانلود Artifact

بعد از اتمام build:

1. روی workflow run که اجرا شد کلیک کنید
2. پایین صفحه، بخش **"Artifacts"** را ببینید
3. فایل **"RAWdesk-windows-x86-portable.zip"** را دانلود کنید
4. Extract کنید و استفاده کنید!

---

## 🎯 چرا باید merge کنیم؟

| قبل از Merge | بعد از Merge |
|--------------|--------------|
| ❌ دکمه Run workflow نیست | ✅ دکمه Run workflow دارد |
| ❌ فقط با push اجرا می‌شود | ✅ دستی هم اجرا می‌شود |
| ⚠️  در branch جداگانه | ✅ در branch اصلی |

---

## 💡 نکات مهم

### ✅ بعد از Merge چه اتفاقی می‌افتد؟

1. **Workflow خودکار اجرا می‌شود** (یکبار)
2. **دکمه "Run workflow" ظاهر می‌شود**
3. **هر وقت بخواهید می‌توانید دوباره اجرا کنید**

### ⏱️ چقدر طول می‌کشد؟

- **Merge**: کمتر از 1 دقیقه
- **Build**: 15-20 دقیقه
- **دانلود**: بستگی به سرعت اینترنت

---

## 📋 Checklist

قبل از شروع:
- [ ] PR #2 را باز کنید
- [ ] "Merge pull request" را کلیک کنید
- [ ] "Confirm merge" را بزنید

بعد از Merge:
- [ ] به صفحه Actions بروید
- [ ] "Build RAWdesk" را انتخاب کنید
- [ ] "Run workflow" را کلیک کنید
- [ ] منتظر اتمام build بمانید
- [ ] Artifact را دانلود کنید

---

## 🆘 در صورت مشکل

### اگر بعد از merge هم دکمه نیست:

1. **صفحه را Refresh کنید** (F5)
2. **Logout و Login کنید به GitHub**
3. **10-20 ثانیه صبر کنید**

### اگر build ناموفق بود:

1. روی workflow run کلیک کنید
2. "Re-run failed jobs" را بزنید
3. یا با ما تماس بگیرید

---

## 🔗 لینک‌های مفید

| مورد | لینک |
|------|------|
| Pull Request | https://github.com/akmfad1/rustdesk/pull/2 |
| Actions صفحه | https://github.com/akmfad1/rustdesk/actions |
| راهنمای کامل | WORKFLOW_EXECUTION_GUIDE.md |
| مستندات کامل | RAWDESK_PERSIAN_README.md |

---

## ✨ خلاصه در یک نگاه

```
┌──────────────────────────────────────────┐
│                                          │
│  1️⃣  PR را merge کنید                   │
│                                          │
│  2️⃣  به Actions بروید                   │
│                                          │
│  3️⃣  "Run workflow" را کلیک کنید        │
│                                          │
│  4️⃣  Artifact را دانلود کنید            │
│                                          │
└──────────────────────────────────────────┘
```

**همین! خیلی ساده است! 🎉**

---

## 🎬 بعد از Build موفق

شما خواهید داشت:
- ✅ RAWdesk.exe (برنامه اصلی)
- ✅ sciter.dll (کتابخانه مورد نیاز)
- ✅ README.txt (اطلاعات)

**نیاز به نصب نیست** - فقط اجرا کنید!

---

**موفق باشید! 🚀**

اگر سؤال دارید:
- راهنمای کامل: `WORKFLOW_EXECUTION_GUIDE.md`
- مستندات فارسی: `RAWDESK_PERSIAN_README.md`
- راهنمای استفاده: `HOW_TO_USE_RAWDESK.md`
