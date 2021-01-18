import React, { Component } from 'react';
import Users from './Users';
import User from './User';

class App extends Component {
	state = {
		selectUser: null
	};

	selectUser = (user) => {
		this.setState({ selectUser: user })
	}

  render() {
    return (
      <div className="container mx-auto px-4">
				{this.state.selectUser ?
					<User user={this.state.selectUser} selectUser={this.selectUser}  /> :
					<Users selectUser={this.selectUser} />}
      </div>
    );
  }
}

export default App;
