# Repository Guidelines

## Project Structure & Module Organization
- Core Dynare source files live at the root (`tank_model.mod`, `TANK_model1.mod`, `TANK_model2.mod`, `TANKC_model1.mod`, `TANKC_model2.mod`). Edit these when changing equations, parameters, or shocks.
- Generated MATLAB packages sit in `+tank_model`, `+TANK_model1`, `+TANK_model2`, `+TANKC_model1`, and `+TANKC_model2`; each contains `driver.m`, `dynamic*.m`, `static*.m`, and optional steady-state helpers. Regenerate via Dynare instead of manual edits.
- Calibration outputs and diagnostics (`*_steady.*`, `*.mat`, `*.log`, `checksum`) record steady states and run metadata. Update them only when model changes require new baselines.
- `TANK.lyx` contains the accompanying paper/notes; keep it synchronized with model changes where relevant.

## Build, Test, and Development Commands
- Run a model in MATLAB: `dynare TANK_model1.mod` (or any `.mod` name) to compile, solve, and produce simulation outputs/logs.
- Run in Octave: `octave --quiet --eval "dynare TANK_model1.mod"` for a non-interactive build. Expect regenerated `+PACKAGE` folders and updated steady-state files.
- Rerun after parameter tweaks to refresh generated code and verify steady-state convergence.

## Coding Style & Naming Conventions
- Indent Dynare blocks consistently (two spaces) and group parameters, variables, shocks, and equations in clearly labeled sections.
- Prefer descriptive variable names matching the paper (e.g., `P_alpha`, `U_c`, `lambda`); avoid introducing new abbreviations without explanation.
- Keep comments concise; mirror the existing Japanese-first commentary style and add English notes when clarification helps future readers.
- Do not hand-edit files under `+PACKAGE/`; place custom steady-state routines in the corresponding package (e.g., `+tank_model/steadystate.m`) and let Dynare manage the rest.

## Testing Guidelines
- After any `.mod` change, run the relevant Dynare command and confirm logs show solved steady state with no residual warnings.
- Verify regenerated `checksum` files and steady-state outputs (`*_steady.*`) reflect the new calibration; avoid committing transient `.mat` outputs unrelated to the change.
- For new scenarios, add a short note in `TANK.lyx` summarizing the experiment and any calibration shifts.

## Commit & Pull Request Guidelines
- Use clear, descriptive messages (Japanese is fine) summarizing the model touched and the nature of the change (e.g., parameter update, equation fix, calibration refresh).
- Mention impacted files/models in the description and note whether outputs (`*.log`, `*_steady.*`) were regenerated.
- Link related issues or references and include brief run results (e.g., “`dynare TANK_model2.mod` converged, new steady state saved”).
- Keep diffs focused; separate large calibration sweeps from documentation-only updates to ease review.

## Security & Configuration Tips
- Ensure Dynare and MATLAB/Octave versions stay consistent across contributors to avoid numerical drift; Dynare 5.x or later is recommended.
- Avoid committing large binary artifacts beyond the necessary steady-state snapshots; prefer reproducible runs over archived outputs.
