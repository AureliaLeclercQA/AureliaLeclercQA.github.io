import re

class EmailLibrary:
    def extract_link(self, email_text):
        pattern = r"https?://[^\s]+"
        matches = re.findall(pattern, email_text)
        if matches:
            return matches[0]
        return None
