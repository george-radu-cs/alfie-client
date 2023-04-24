const Map<int, String> migrationsScripts = {
  1: '''
    CREATE TABLE settings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      languageCode TEXT NOT NULL,
      themeMode TEXT NOT NULL,
      themeColor TEXT NOT NULL
    );
  ''',
  2: '''
    INSERT INTO settings (languageCode, themeMode, themeColor) 
      VALUES ('en', 'system', 'blue');
  ''',
  3: '''
    CREATE TABLE groups (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      color TEXT NOT NULL
    );
  ''',
  4: '''
    CREATE TABLE decks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT NOT NULL,
      groupId INTEGER NOT NULL,

      FOREIGN KEY (groupId) REFERENCES groups(id)
    );
  ''',
  5: '''
    CREATE TABLE cards (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      deckId INTEGER NOT NULL,
      type TEXT NOT NULL,

      question TEXT NOT NULL check (length(question) <= 5000),
      questionTextType TEXT NOT NULL,
      questionAttachmentType TEXT NOT NULL,
      questionAttachmentLocalURI TEXT,
      questionAttachmentCloudURI TEXT,

      answer TEXT NOT NULL check (length(answer) <= 5000),
      answerTextType TEXT NOT NULL,
      answerNumberOfOptions INTEGER,
      answerCorrectOptionIndex INTEGER,
      answerAttachmentType TEXT NOT NULL,
      answerAttachmentLocalURI TEXT,
      answerAttachmentCloudURI TEXT,
      timeToAnswer INTEGER NOT NULL,

      lastReviewRating TEXT,
      lastReviewTimestamp INTEGER,
      updatedAtTimestamp INTEGER NOT NULL,

      FOREIGN KEY (deckId) REFERENCES decks(id) ON DELETE CASCADE
    );
  ''',
  6: '''
    CREATE TABLE cardReviews (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      cardId INTEGER NOT NULL,
      rating TEXT NOT NULL,
      timeToAnswer INTEGER NOT NULL,
      reviewTimestamp INTEGER NOT NULL,

      FOREIGN KEY (cardId) REFERENCES cards(id) ON DELETE CASCADE
    );
  ''',
  7: '''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT NOT NULL,
      firstName TEXT NOT NULL,
      lastName TEXT NOT NULL,
      token TEXT
    );
  ''',
  8: '''
    INSERT INTO users (email, firstName, lastName, token) 
      VALUES ('', '', '', NULL);
  ''',
  9: '''
    ALTER TABLE users ADD COLUMN verified BOOLEAN NOT NULL DEFAULT 0;
  ''',
  10: '''
    ALTER TABLE users ADD COLUMN loginCanCheck2FA BOOLEAN NOT NULL DEFAULT 0;
  ''',
  11: '''
    ALTER TABLE settings ADD COLUMN showOCRDialog BOOLEAN NOT NULL DEFAULT 1;
  ''',
};
