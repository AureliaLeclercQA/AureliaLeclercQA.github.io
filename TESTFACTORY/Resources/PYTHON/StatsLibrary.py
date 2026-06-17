import pandas as pd

class StatsLibrary:

    def compute_chi2_and_export(self, counts, filename="results.xlsx"):
        if not isinstance(counts, dict):
            raise ValueError(f"counts doit être un dict, reçu: {type(counts)}")

        faces = list(counts.keys())
        observed = list(counts.values())

        total = sum(observed)
        expected = total / len(faces)

        chi2 = sum((o - expected) ** 2 / expected for o in observed)

        df = pd.DataFrame({
            "Face": faces,
            "Observed": observed,
            "Expected": [expected] * len(faces),
            "Diff": [o - expected for o in observed]
        })

        # ✅ tentative d'export Excel
        try:
            df.to_excel(filename, index=False, engine="openpyxl")
            export_msg = filename
        except Exception as e:
            print(f"⚠️ Export Excel failed: {e}")
            export_msg = "EXPORT_FAILED"

        return chi2, export_msg