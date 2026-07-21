# Linux Command Practice Guide

This project is intentionally structured like a real Spring Boot deployment so
you can practice everyday Linux/DevOps commands on realistic files instead of
empty test folders. Below: what each folder is for, then concrete commands to
run against this exact project.

## Folder Purpose Reference

| Folder | Real-world purpose |
|---|---|
| `src/` | Java application source code (controllers, services, repos, models) and tests |
| `config/` | Externalized configuration: `.properties`, `.yml` files for different environments |
| `logs/` | Runtime logs — `application.log`, `error.log`, `access.log`, `deployment.log` |
| `scripts/` | Shell scripts to build, deploy, backup, clean up, monitor the app |
| `backup/` | Database dump files (`.sql`) and backup manifests |
| `docs/` | README, architecture notes, API docs, changelog |
| `resources/` | Templates, static assets (CSS/JS), sample data files |
| `temp/` | Scratch/temporary files — safe to delete, good for `rm` practice |
| `uploads/` | Simulated user-uploaded files (resumes, docs) |
| `downloads/` | Generated reports/exports (CSV, JSON) |
| `certificates/` | TLS certs and private keys — good for `chmod`/permission practice |
| `secrets/` | Sensitive credentials — should be locked down (`chmod 600/700`) |
| `pom.xml` | Maven build file (dependencies, plugins) |
| `Dockerfile` / `docker-compose.yml` | Container build/orchestration |
| `Jenkinsfile` | CI/CD pipeline definition |

## Command Practice Cheat-Sheet

### Navigation
```bash
pwd                          # show current directory
ls                            # list files
ls -l                         # long listing (permissions, size, owner)
ls -la                        # include hidden files (.git, .gitignore)
ls -lh logs/                  # human-readable sizes
cd config/ && pwd && cd ..    # move into config, confirm, move back
```

### Creating & Removing
```bash
mkdir -p archive/2026         # create nested folders
touch archive/2026/notes.txt  # create empty file
rmdir archive/2026            # remove EMPTY directory only (will fail if not empty)
rm archive/2026/notes.txt     # remove a file
rm -r archive                 # remove directory and contents
```

### Copying & Moving
```bash
cp config/application.properties config/application.properties.bak
mv config/application.properties.bak backup/
cp -r docs/ docs_copy/
mv docs_copy/ archive_docs/
rm -r archive_docs/
```

### Reading Files
```bash
cat docs/README.md                  # print whole file
head -n 10 logs/application.log     # first 10 lines
tail -n 10 logs/application.log     # last 10 lines
tail -f logs/application.log        # live-follow (Ctrl+C to stop)
```

### Searching
```bash
grep "ERROR" logs/application.log            # find ERROR lines
grep -i "warn" logs/*.log                    # case-insensitive, all logs
grep -c "INFO" logs/application.log          # count matches
grep -rn "TODO" src/                         # recursive search with line numbers
find . -name "*.sh"                          # find all shell scripts
find . -name "*.log"                         # find all log files
find backup/ -mtime +30                      # backups older than 30 days
find logs/ -mtime -7                         # logs modified in last 7 days
```

### Permissions & Ownership
```bash
ls -l secrets/                 # secrets/ should show drwx------ (700)
chmod 600 secrets/api-keys.env # owner read/write only
chmod 755 scripts/build.sh     # make script executable
chmod -R 644 config/           # recursively set read-only config files
chown $(whoami) uploads/*      # change ownership (may need sudo)
```

### Disk & Process Monitoring
```bash
du -sh .                       # total size of project
du -sh */                      # size per top-level folder
df -h                          # disk free space on the system
ps aux                         # all running processes
ps aux --sort=-%mem | head     # top memory consumers
top                            # live process monitor (press q to quit)
```

### Combining Commands (once comfortable)
```bash
grep "ERROR" logs/*.log | wc -l              # count total errors across logs
find . -name "*.properties" -exec cat {} \;  # print all properties files
du -ah . | sort -rh | head -10               # 10 largest files/folders
```

## Suggested Practice Flow

1. `cd` into the project and run `pwd`, `ls -la` to get oriented.
2. Use `find` + `grep` to locate all `ERROR` entries across `logs/`.
3. Practice permission hardening: lock down `secrets/` and `certificates/server.key`.
4. Simulate a backup: `tar -czf backup/uploads_$(date +%Y%m%d).tar.gz uploads/`.
5. Clean `temp/` using `rm`, then recreate it with `mkdir`.
6. Use `du -sh */` to see which folder is the largest.
7. Run `scripts/monitor.sh` to see `df`, process, and log commands used together.
