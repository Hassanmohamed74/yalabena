SpeakUp / yalabena — Frontend Completion Patch
Generated: 2026-10-09

WHAT THIS PATCH ADDS/FIXES
1. Adds a Knowledge Base page with category/article search, category creation, article creation and editing, visibility selection, and version metadata display. It uses the existing NestJS /kb endpoints.
2. Adds a Reports & Analytics page for the existing eight backend reports: sales funnel, lead-source ROI, group fill rate, teacher utilization, student progress, revenue, outstanding payments, and attendance. Supports date/month/ID filters and CSV export of the displayed rows.
3. Wires Knowledge Base and Reports into the active frontend router (front/src/App.tsx).
4. Adds the activity-attendance route and a public course catalog route at /catalog.
5. Removes the stale duplicate router implementation in front/src/routes/index.tsx by making it re-export the single active App router.
6. Aligns sidebar links and frontend route gates with the roles permitted by the current backend controllers, including audit/security routes.
7. Exports the new API clients from front/src/api/index.ts.

SAFETY
- This patch ZIP contains only the eight listed source files plus this README, manifest, and PowerShell installer.
- It does NOT contain .git, node_modules, dist, build, coverage, or your environment files.
- The script only adds/replaces the exact listed files and never deletes pre-existing user files or touches your database. If copying fails midway, rollback restores backed-up files and removes only new patch files created by that failed run.
- Before replacing any existing target file, it backs it up to a sibling folder named like yalabena-main.backup-YYYYMMDD-HHMMSS, outside your project folder.
- It validates the project and patch files first, then asks you to type APPLY.

INSTALL
1. Extract this ZIP into a temporary folder, for example C:\Users\WinDows\Desktop\SpeakUp-Frontend-Updates.
2. Open PowerShell and run:
   cd "$env:USERPROFILE\Desktop\SpeakUp-Frontend-Updates"
   powershell -ExecutionPolicy Bypass -File .\Apply-SpeakUpPatch.ps1 -ProjectRoot "$env:USERPROFILE\Desktop\yalabena-main"
3. Review the paths it prints and type APPLY only if the project path is correct.
4. Open another PowerShell window and run:
   cd "$env:USERPROFILE\Desktop\yalabena-main\front"
   npm ci
   npm run build
5. If npm run build fails, save the complete error output before making further edits.

NOTES / LIMITATIONS
- This environment did not include front/node_modules, so a real frontend build could not be run here. Run npm ci and npm run build on your machine after applying.
- Reports use the existing backend API contracts. Student-progress and attendance reports require a Student UUID or Group UUID respectively.
- CSV export is implemented for displayed report data. PDF export is not implemented in this patch.
- The current backend Knowledge Base endpoints do not expose article deletion, so the UI does not add delete functionality.
- The existing public landing page remains at /welcome; the public course catalog is available at /catalog. The authenticated dashboard remains at /.
