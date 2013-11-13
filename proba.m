function dtdy = proba(t, y )
    dtdy = [y(2) y(3) (t+y(1)*2)/(t*t)]
end

