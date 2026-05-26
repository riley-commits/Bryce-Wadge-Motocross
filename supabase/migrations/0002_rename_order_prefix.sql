-- Brand rename: "Bryce Wadge Motocross" → "Bryce Wadge Motocross Training".
-- The abbreviation embedded in order_number defaults changes from BWM- to BWMT-.
--
-- The underlying sequence (`order_number_seq`) is reused so numbering keeps
-- counting forward; only the prefix in the column default changes. Any orders
-- that were already inserted under the old prefix retain their original
-- BWM-XXXX value — this migration only affects rows inserted from now on.

alter table orders
  alter column order_number
  set default 'BWMT-' || lpad(nextval('order_number_seq')::text, 4, '0');
