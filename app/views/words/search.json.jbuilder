json.array! @words do |word|
  json.id word.id
  json.word word.word
  json.meaning word.meaning
  json.user_id word.user_id
  json.group_id word.group_id
  json.user_sign_in current_user
end