import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''{
  "type": "service_account",
  "project_id": "booming-cascade-316815",
  "private_key_id": "691a7fa9d723c854b9d8bc07fd8c6addbc0a1ab7",
  "private_key": "nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzw8vLnNSOXy8J\nuSwfBtI7lhihUBLnjwik4fM4xjhIL4jCSgv0bhFbLaGEPChgyz41oAlUO3/IEbVv\nzhWpFNuU/e9aLlWv2frjcOikpAOT8o/L0qViieVelB6cRlJUejm9yFDgQSSrM9Rq\n7vQ5afJAVALBzY1ZdqqK7AyneCGsVzmek188P/kcS1vSXxc/ZrSSjRXk8pJpV+Pz\naZEDhAj+YbNH+5isnQBkTqY7Qhh4y7bp8PTZQgNwZLpUayrtjhm29+Vc4ZA+XVh2\nwWGvPqqkWUfyPoU9P4nyz4fhh8AMC8kIjgDkoyxOU/dkPVRRkp7+AeV08Tr8lLrg\npu26SJOXAgMBAAECggEAKzSifUAm6EchT5V1cMmbat3i8paDzKrYmYSDCEDAEz11\ngbj5UZjIzCDWAqnQzJ7cx1e9FkUsq6Hx+TrPgvFz60XzKrobNyZNgi/Hgpa3E26H\nuCXbQSlCey5fgxD1xb8QtLf6FEQj85AD/GWNRmVb57EpbnoggIGgcL5WNkQN19VB\nqylLnjTB5kqPbDHHnlc4u91oUgVj9ye8Yt3MAeL8F6U+AUkFEaxeupyduD1ud5x1\ne/65IaFVtWSTsrqHDKgwaziWvooqKwRcbUSGbrUfTNjpdD16Mb2/d8pyRYwDCDWU\n9bMIjx+7zeJFa4OEyC/SVb4FwWc9MVmi7bsCwg7Y6QKBgQDmymdIrqa4IaEgqGIG\nYxn3k9Ri1sEmq4JByYR84LlhnytF6xgmRrTp1Xl7fSbSR7T/aiG84WtLSQTlzeDi\n2RZ+gvVzMsCheAhrG/cHNjUzeB7ahkVpGIwUI/DXPdPpVD7PMsHJNRFqLsatWfou\ntOzqug32yw+ZOpjPdrPOjY3TaQKBgQDHZo7wXCLtJfyHpuKV6LYJVt9P6rXpKznt\nLM8l56paOkowDNY2LgHj8r0j97ofOdNbae4pQxaHas8iJnfrgM9iZO/1mprhHqex\niyy3yljRXbahtA2+Up1zdX/MmhOShOuun1xAGh2QEm9a/q717p1bsmPvlUPon/6x\nuE24mLFO/wKBgQC7lcAlX2+7MfpZJQOn1V0B0nJKc+tClxykhDrflXiYVFtD1TYn\nxki91vmK2cp4GDiRcZ5Ce6ZN5ufIMXKcb37NDXybSaEwnPOau3wprHHJh9TsIT7B\nkWYp6JyVFnfrqsHyf3rrI+sntyVdOUkUNZJrpxY6hgoDrZEO75huRrgEIQKBgBoU\ntAWER501Jr6neWOaOJUoI7VUQc7ptH3tKnsOvh1nGmUGiM41XlHuYgbeVB3Zdmey\nh1AmUkAMHGOfHHhVNMrt4OUC/9cKJ2z1gzfW458e3tBvuIx4SdfcOocMcBrt/9Wr\nSmmoAM3jW2VPgprwRuzDfIbNw0AeDTY5oRDQCAEJAoGADz9DMnWTNTY2m8hpAHfr\nC+x0solNpAzCMTK6lJmBjFwx/aw30VLspkKlrbnB686QRw11LwcwKqzvE3nsv1ns\nWTuY+zYmchOkQJpmwccuFkX7uk4pd++DTO/ABZ4dXuBkqMD7fwLs03XtgRfdjEhS\nk4pmqa7tBYekBsAsHDTVo68=",
  "client_email": "gsheets@booming-cascade-316815.iam.gserviceaccount.com",
  "client_id": "114408706409796794346",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40booming-cascade-316815.iam.gserviceaccount.com"
}''';
//spredsheet id
const _spreadsheetId = '1RsaDA-sEdwT_sOY01Vpd7t01ZFBqFyuKY3Z9r-nKUDQ';

void main() async {
  // init GSheets
  final gsheets = GSheets(_credentials);
  // fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);
  // get worksheet by its title
  final sheet = await ss.worksheetByTitle('Sheet1');

Future<void> basic() async {
  // prints - [100, Product A, 50, 100.0]
  print(await sheet!.values.row(2));

  // prints - [Product A, Product B, Product C, Product D, Product F, Product G]
  // we use 'fromRow' to skip first row
  print(await sheet.values.column(2, fromRow: 2));

  // prints - Product A
  print(await sheet.values.value(row: 2, column: 2));

  // inserts passed values into second row
  await sheet.values.insertRow(
    2,
    [200, 'Ex Product A', 60, 110.0],
  );

  // updates B2 cell by inserting passed value
  await sheet.values.insertValue(
    'Product A',
    row: 2,
    column: 2,
  );

  // appends passed values to the products table
  await sheet.values.appendRow(
    [200, 'Ex Product A', 60, 110.0],
  );
  
  // deletes row #8
  await sheet.deleteRow(8);
}
}