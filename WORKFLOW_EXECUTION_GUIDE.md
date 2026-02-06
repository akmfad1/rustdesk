# راهنمای اجرای Workflow / Workflow Execution Guide

## ❓ چرا دکمه "Run workflow" نمایش داده نمی‌شود؟ / Why is "Run workflow" button not showing?

### 🔍 علت / Reason

GitHub فقط دکمه "Run workflow" را برای workflow هایی نمایش می‌دهد که در **branch پیش‌فرض** (default branch) مخزن باشند.

- ✅ Workflow های ما دارای `workflow_dispatch` trigger هستند
- ❌ اما در branch `copilot/setup-rawdesk-client` هستند، نه `master`

GitHub only shows the "Run workflow" button for workflows in the **default branch** of the repository.

- ✅ Our workflows have `workflow_dispatch` trigger
- ❌ But they are in `copilot/setup-rawdesk-client` branch, not `master`

---

## 💡 راه حل‌ها / Solutions

### گزینه 1: Merge کردن PR به Master (توصیه می‌شود) / Option 1: Merge PR to Master (Recommended)

این بهترین و استاندارد‌ترین روش است:

1. **Approve و Merge کنید**:
   - به Pull Request #2 بروید
   - PR را review کنید
   - "Merge pull request" را کلیک کنید
   - "Confirm merge" را بزنید

2. **بعد از Merge**:
   - به https://github.com/akmfad1/rustdesk/actions بروید
   - "Build RAWdesk (Windows 32-bit)" را انتخاب کنید
   - حالا دکمه "Run workflow" را خواهید دید! 🎉

This is the best and most standard approach:

1. **Approve and Merge**:
   - Go to Pull Request #2
   - Review the PR
   - Click "Merge pull request"
   - Click "Confirm merge"

2. **After Merge**:
   - Go to https://github.com/akmfad1/rustdesk/actions
   - Select "Build RAWdesk (Windows 32-bit)"
   - Now you'll see the "Run workflow" button! 🎉

---

### گزینه 2: Push مستقیم به Master / Option 2: Direct Push to Master

⚠️ **توجه**: این روش PR را bypass می‌کند و توصیه نمی‌شود.

```bash
# Checkout master
git checkout master

# Pull latest changes
git pull origin master

# Merge changes from PR branch
git merge copilot/setup-rawdesk-client

# Push to master
git push origin master
```

⚠️ **Warning**: This bypasses the PR and is not recommended.

---

### گزینه 3: اجرا از طریق GitHub API / Option 3: Run via GitHub API

اگر نمی‌توانید منتظر merge بمانید، می‌توانید با API اجرا کنید:

```bash
# نیاز به GitHub Personal Access Token دارید
curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  https://api.github.com/repos/akmfad1/rustdesk/actions/workflows/build-rawdesk.yml/dispatches \
  -d '{"ref":"copilot/setup-rawdesk-client"}'
```

If you can't wait for merge, you can run via API:

```bash
# You need a GitHub Personal Access Token
curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  https://api.github.com/repos/akmfad1/rustdesk/actions/workflows/build-rawdesk.yml/dispatches \
  -d '{"ref":"copilot/setup-rawdesk-client"}'
```

---

### گزینه 4: Trigger خودکار از طریق Push / Option 4: Auto Trigger via Push

Workflow ها همچنین با push و PR به‌طور خودکار trigger می‌شوند:

```yaml
on:
  workflow_dispatch:  # Manual trigger
  push:
    branches:
      - main
      - master
  pull_request:
    branches:
      - main
      - master
```

وقتی PR merge شود، workflow به‌طور خودکار اجرا می‌شود.

Workflows also auto-trigger on push and PR:

When the PR is merged, the workflow will run automatically.

---

## 🎯 توصیه نهایی / Final Recommendation

**بهترین روش: Merge کردن PR**

1. ✅ استاندارد و safe
2. ✅ Code review انجام می‌شود
3. ✅ دکمه "Run workflow" بعد از merge ظاهر می‌شود
4. ✅ Workflow به‌طور خودکار یکبار اجرا می‌شود
5. ✅ بعداً می‌توانید دستی اجرا کنید

**Best approach: Merge the PR**

1. ✅ Standard and safe
2. ✅ Code review happens
3. ✅ "Run workflow" button appears after merge
4. ✅ Workflow runs automatically once
5. ✅ You can run manually afterwards

---

## 📊 وضعیت Workflow ها / Workflow Status

### Build RAWdesk (Windows 32-bit)

- **فایل**: `.github/workflows/build-rawdesk.yml`
- **Trigger**: `workflow_dispatch`, `push`, `pull_request`
- **وضعیت**: ✅ آماده برای اجرا بعد از merge
- **Status**: ✅ Ready to run after merge

### Build RustDesk Sciter (32-bit Windows)

- **فایل**: `.github/workflows/build-simple-x86.yml`
- **Trigger**: `workflow_dispatch` (با inputs)
- **وضعیت**: ✅ آماده برای اجرا بعد از merge
- **Status**: ✅ Ready to run after merge

---

## 🔗 لینک‌های مفید / Useful Links

- **Actions صفحه**: https://github.com/akmfad1/rustdesk/actions
- **Pull Request #2**: https://github.com/akmfad1/rustdesk/pull/2
- **مستندات GitHub Actions**: https://docs.github.com/en/actions/using-workflows/manually-running-a-workflow

---

## ❓ سؤالات متداول / FAQ

### Q: چرا workflow ها در branch دیگر نمایش داده می‌شوند؟
A: GitHub همه workflow ها را نشان می‌دهد، اما دکمه "Run workflow" فقط برای default branch نمایش داده می‌شود.

### Q: آیا می‌توانم workflow را قبل از merge تست کنم؟
A: بله! وقتی commit می‌کنید، workflow به‌طور خودکار برای PR اجرا می‌شود.

### Q: بعد از merge چقدر طول می‌کشد تا دکمه ظاهر شود؟
A: معمولاً فوری است. صفحه را refresh کنید.

### Q: Why do workflows show in other branches?
A: GitHub shows all workflows, but the "Run workflow" button only appears for the default branch.

### Q: Can I test the workflow before merge?
A: Yes! When you commit, the workflow runs automatically for the PR.

### Q: How long after merge until button appears?
A: Usually immediate. Refresh the page.

---

## ✅ خلاصه / Summary

```
┌─────────────────────────────────────────────────────────────┐
│                                                              │
│  1. PR را merge کنید / Merge the PR                        │
│  2. به Actions بروید / Go to Actions                       │
│  3. Workflow را انتخاب کنید / Select workflow              │
│  4. "Run workflow" را کلیک کنید / Click "Run workflow"    │
│  5. منتظر artifact بمانید / Wait for artifact              │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

**موفق باشید! / Good luck!** 🚀
