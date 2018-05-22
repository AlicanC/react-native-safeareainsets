/* @flow */

import * as React from 'react';
import { requireNativeComponent } from 'react-native';

const RCTSafeAreaInsets = requireNativeComponent('RCTSafeAreaInsets', {
  name: 'RCTSafeAreaInsets',
  displayName: 'RCTSafeAreaInsets',
});

type Insets = {
  top: number,
  right: number,
  bottom: number,
  left: number,
};

type Props = {
  children: (safeAreaInsets: Insets) => React.Node,
};

type State = {
  insets: Insets,
};

export default class SafeAreaInsets extends React.PureComponent<Props, State> {
  state = {
    insets: { top: 0, right: 0, bottom: 0, left: 0 },
  };

  _onSafeAreaInsetsChange = (event: SyntheticEvent<>) => {
    // $FlowFixMe
    const { insets } = event.nativeEvent;

    this.setState({ insets });
  };

  render() {
    const { children, ...restProps } = this.props;
    const { insets } = this.state;

    return (
      <RCTSafeAreaInsets onSafeAreaInsetsChange={this._onSafeAreaInsetsChange} {...restProps}>
        {children(insets)}
      </RCTSafeAreaInsets>
    );
  }
}
