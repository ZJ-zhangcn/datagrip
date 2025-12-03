select
  case
    when to_date('?InjuryDate?', 'yyyy-mm-dd') >= to_date('?PolicyYear?', 'yyyy-mm-dd') and to_date('?InjuryDate?', 'yyyy-mm-dd') >= to_date('?MaturityDate?', 'yyyy-mm-dd') then
          greatest(
            (case
                when exists (select 1 from lcpol where polno = '?PolNo?'
                    and (payintv = 0 or (payintv = 12 and (paytodate=payenddate or (paytodate<payenddate and paytodate>to_date('?InjuryDate?', 'yyyy-mm-dd')) )))
                ) then
                (
                    select ?LJJQAmnt? / 1000 * (p.cv2 * ?ThroughDayRate? + p.cv1 * (1 - ?ThroughDayRate?))
                    from PUA_1111001 p
                    where p.age = '?InsuredAppAge?'
                    and p.gender = '?Sex?'
                    and p.dt = '?Anniv?'
                )
                when exists (select 1 from lcpol where polno = '?PolNo?'
                    and payintv = 12 and paytodate < to_date('?InjuryDate?', 'yyyy-mm-dd') and paytodate<payenddate
                ) then
                (
                    select ?LJJQAmnt? / 1000 * p.cv2
                    from PUA_1111001 p
                    where p.age = '?InsuredAppAge?'
                    and p.gender = '?Sex?'
                    and p.dt = '?Anniv?'
                )
            end
            ),
            ?LJJQAmnt? * power((1 + 0.02), ?Anniv? - 1)
          )
          else (case when exists (select 1 from lcpol where polno = '?PolNo?'
                    and (payintv = 0 or (payintv = 12 and (paytodate=payenddate or (paytodate<payenddate and paytodate>to_date('?InjuryDate?', 'yyyy-mm-dd')) )))
                ) then
                (
                    select ?LJJQAmnt? / 1000 * (p.cv2 * ?ThroughDayRate? + p.cv1 * (1 - ?ThroughDayRate?))
                    from PUA_1111001 p
                    where p.age = '?InsuredAppAge?'
                    and p.gender = '?Sex?'
                    and p.dt = '?Anniv?'
                )
                when exists (select 1 from lcpol where polno = '?PolNo?'
                    and payintv = 12 and paytodate < to_date('?InjuryDate?', 'yyyy-mm-dd') and paytodate<payenddate
                ) then
                (
                    select ?LJJQAmnt? / 1000 * p.cv2
                    from PUA_1111001 p
                    where p.age = '?InsuredAppAge?'
                    and p.gender = '?Sex?'
                    and p.dt = '?Anniv?'
                )
                end
                )
  end from dual