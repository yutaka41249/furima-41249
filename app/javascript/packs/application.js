// app/javascript/packs/application.js

import "gon"; // gonのインポート
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

// Rails、Turbolinks、ActiveStorageの開始
Rails.start();
Turbolinks.start();
ActiveStorage.start();
