FactoryGirl.define do
  factory :clergyman do
    first_name 'MyFirstClergymanName'
    middle_name 'MyMiddleName'
    last_name 'MyLastClergymanName'
    rank 'deacon'
    birth '2017-01-05'
    engagement '2017-01-05'
    wedding '2017-01-05'
    baptism '2017-01-05'
    confirmation '2017-01-05'
    deacon_ordination '2017-01-05'
    pastor_ordination '2017-01-05'
    bishop_installation '2017-01-05'
  end

  factory :deacon, class: Clergyman do
    first_name 'MyFirstDeaconName'
    middle_name 'MyMiddleName'
    last_name 'MyLastDeaconName'
    rank 'deacon'
    birth '2017-01-05'
    engagement '2017-01-05'
    wedding '2017-01-05'
    baptism '2017-01-05'
    confirmation '2017-01-05'
    deacon_ordination '2017-01-05'
    pastor_ordination '2017-01-05'
    bishop_installation '2017-01-05'
  end

  factory :pastor, class: Clergyman do
    first_name 'MyFirstPastorName'
    middle_name 'MyMiddleName'
    last_name 'MyLastPastorName'
    rank 'pastor'
    birth '2017-01-05'
    engagement '2017-01-05'
    wedding '2017-01-05'
    baptism '2017-01-05'
    confirmation '2017-01-05'
    deacon_ordination '2017-01-05'
    pastor_ordination '2017-01-05'
    bishop_installation '2017-01-05'
  end

  factory :bishop, class: Clergyman do
    first_name 'MyFirstBishopName'
    middle_name 'MyMiddleName'
    last_name 'MyLastBishopName'
    rank 'bishop'
    birth '2017-01-05'
    engagement '2017-01-05'
    wedding '2017-01-05'
    baptism '2017-01-05'
    confirmation '2017-01-05'
    deacon_ordination '2017-01-05'
    pastor_ordination '2017-01-05'
    bishop_installation '2017-01-05'
  end
end
