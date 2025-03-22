from devopslib.randomfruit import fruit


def test_fruits():
    fruit_choice = fruit()
    assert fruit_choice in ["apple", "cherry", "strawberry"]
